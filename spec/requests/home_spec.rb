require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET root_path' do
    let(:user) { create(:user, :with_followed_posts) }

    before do
      sign_in user
    end

    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'shows posts' do
      post = create(:post, user:)
      get '/'
      expect(response.body).to include(post.title)
      expect(response.body).to include(post.body)
      expect(response.body).to include(user.followed_posts.first.title)
      expect(response.body).to include(user.followed_posts.first.body)
      expect(response.body).to include(user.followed_posts.last.title)
      expect(response.body).to include(user.followed_posts.last.body)
    end
  end
end
