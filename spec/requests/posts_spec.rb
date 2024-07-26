require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /posts' do
    it 'works! (now write some real specs)' do
      get '/posts'
      expect(response).to have_http_status(200)
    end
  end

  describe 'get /posts/:id' do
    it 'works! (now write some real specs)' do
      post = create(:post, user:)
      get "/posts/#{post.id}"
      expect(response).to have_http_status(200)
      expect(response.body).to include(post.title)
      expect(response.body).to include(post.body)
    end
  end
end
