require 'rails_helper'

RSpec.feature 'CreatePosts', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit subject_path
  end

  context 'On Posts index page' do
    let(:subject_path) { posts_path }

    scenario 'valid post' do
      fill_in 'post_title', with: 'Title'
      fill_in 'post_body', with: 'Body'

      click_button 'SAVE POST'

      expect(page).to have_content('Post was successfully created.')
      expect(page).to have_content('Title')
      expect(page).to have_content('Body')
    end

    scenario 'invalid post' do
      within '#new_post form' do
        click_button 'SAVE POST'
      end

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Body can't be blank")
    end
  end

  context 'On Home page' do
    let(:subject_path) { root_path }

    scenario 'valid post' do
      fill_in 'post_title', with: 'Title'
      fill_in 'post_body', with: 'Body'

      click_button 'SAVE POST'

      expect(page).to have_content('Post was successfully created.')
      expect(page).to have_content('Title')
      expect(page).to have_content('Body')
    end

    scenario 'invalid post' do
      within '#new_post form' do
        click_button 'SAVE POST'
      end

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Body can't be blank")
    end
  end
end
