require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @user_one = User.create(name: 'Taylor', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from New York.')

    Post.create(user: @user_one, title: 'Title', text: 'This is my post')
    Post.create(user: @user_one, title: 'hello', text: 'This is my post')
    Post.create(user: @user_one, title: 'Hill', text: 'This is my post')
  end

  it 'to show all usernames' do
    visit '/'
    expect(page).to have_content(@user_one.name)
  end

  describe 'user index view' do
    it 'to show profile picture' do
      visit '/'
      expect(page).to have_tag('img', src: @user_one.photo)
    end

    it 'to show profile picture' do
      visit '/'
      expect(page).to have_tag('link')
    end
  end

  it 'nubers of post tha each user has written' do
    visit '/'
    expect(page).to have_content(@user_one.posts_counter)
  end

  it "when you click to an user, redirects to user's show page" do
    visit '/'
    click_on(@user_one.name)
    expect(current_path).to eq(user_path(@user_one.id))
  end

  describe 'user show view' do
    it 'to show profile picture' do
      visit "/users/#{@user_one.id}"
      expect(page).to have_tag('img', src: @user_one.photo)
    end

    it 'to show each user name' do
      visit "/users/#{@user_one.id}"
      expect(page).to have_content(@user_one.name)
    end

    it 'numbers of post tha each user has written' do
      visit "/users/#{@user_one.id}"
      expect(page).to have_content(@user_one.posts_counter)
    end

    it 'to show each user bio' do
      visit "/users/#{@user_one.id}"
      expect(page).to have_content(@user_one.bio)
    end

    it "to show the user's first 3 posts " do
      visit "/users/#{@user_one.id}"
      expect(page).to have_content(@user_one.recent_posts[0].text)
      expect(page).to have_content(@user_one.recent_posts[1].text)
      expect(page).to have_content(@user_one.recent_posts[2].text)
    end

    it "to show view all of a user's posts" do
      visit "/users/#{@user_one.id}"

      expect(page).to have_tag('button')
    end

    it 'when you click to an user, redirects to post index page' do
      visit "/users/#{@user_one.id}"
      expect(page).to have_tag('a', href: user_posts_path(@user_one))
    end

    it 'when you click to an user, redirects to post show page' do
      visit "/users/#{@user_one.id}"
      expect(page).to have_tag('a', href: user_post_path(@user_one, @user_one.recent_posts[0].id))
    end
  end
end
