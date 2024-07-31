require 'rails_helper'

RSpec.feature 'UpdatePosts', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'update post' do
    post = create(:post, user:)
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', with: 'Title updated'
    fill_in 'Body', with: 'Body updated'
    click_on 'Save'
    expect(page).to have_content('Title updated')
    expect(page).to have_content('Body updated')
  end
end
