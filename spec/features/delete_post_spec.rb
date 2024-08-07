require 'rails_helper'

RSpec.feature 'DeletePosts', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'delete post' do
    post = create(:post, user:)
    visit post_path(post)
    accept_confirm do
      click_on 'Delete'
    end
    expect(page).to have_content('Post was successfully deleted.')
    expect(page).not_to have_content(post.title)
  end
end
