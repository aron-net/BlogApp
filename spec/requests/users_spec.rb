require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) { get users_path }

    it 'index action renders the corect template' do
      expect(response).to render_template(:index)
    end

    it 'the repose is correct' do
      expect(response.status).to eq(200)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Find me in app/views/users/index.html.erb')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_path(1) }

    it 'show action renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'show respone is correct' do
      expect(response.status).to eq(200)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Users#show')
    end
  end
end
