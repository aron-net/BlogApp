require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get posts_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Find me in app/views/post/index.html.erb')
    end  
  end
  
  describe 'GET /show' do
    before(:each) { get user_path(1) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'matches the placeholder text with the respone body' do
      expect(response.body).to include('Post#show')
    end
  end    
end
