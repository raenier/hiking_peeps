require 'rails_helper'

RSpec.feature 'CreatePosts', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'valid post' do
    visit posts_path

    fill_in 'Title', with: 'Title'
    fill_in 'Body', with: 'Body'
    click_button 'Save'

    expect(page).to have_content('Post was successfully created.')
    expect(page).to have_content('Title')
    expect(page).to have_content('Body')
  end

  scenario 'invalid post' do
    visit posts_path

    within '#new_post form' do
      click_button 'Save'
    end

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
