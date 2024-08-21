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
    fill_in 'post_title', with: 'Title updated'
    fill_in 'post_body', with: 'Body updated'
    click_on 'SAVE POST'

    expect(page).to have_content('Title updated')
    expect(page).to have_content('Body updated')
  end

  scenario 'invalid post' do
    post = create(:post, user:)

    visit post_path(post)
    click_on 'Edit'
    fill_in 'post_title', with: ''
    fill_in 'post_body', with: ''
    click_on 'SAVE POST'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
