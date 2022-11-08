require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before :each do
    @user_one = User.create(name: 'Taylor', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from New York.')
    @user_two = User.create(name: 'Ofelia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Amsterdam.')

    3.times do
    Post.create(user_id: @user_one, title: 'Title', text: 'This is my post')
    end

    3.times do
    Post.create(user_id: @user_two, title: 'Title', text: 'This is my post')
    end
    end

    it "to show all usernames" do
    visit '/'
    expect(page).to have_content(@user_one.name)
    end

    it "to show profile picture" do
    visit '/'
    expect(page).to have_content(@user_two.photo)
    end

    it "nubers of post tha each user has written" do
    visit '/'
    expect(page).to have_content(@user_one.posts_counter)
    end

    it "when you click to an user, redirects to user's show page" do
    visit '/'

    end
end
