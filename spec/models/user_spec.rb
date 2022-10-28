require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject do 
    User.new(
      name: 'Tom', 
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )
  end
  
  before { subject.save } # save the user before each test

  context 'Return valid data' do
    it 'should accept name' do
      subject.name = 'Tom'
      expect(subject).to be_valid
    end

    it 'should accept post_counter' do
      subject.posts_counter = 3
      expect(subject).to be_valid
    end  
  end
  
  context 'Return invalid data' do
    it 'should not accept blank name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not accept negative post_counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
    
    it 'should not accept non numerical' do
      subject.posts_counter = 'count'
      expect(subject).to_not be_valid
    end  
  end
end
