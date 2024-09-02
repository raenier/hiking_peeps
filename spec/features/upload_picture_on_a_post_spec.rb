require 'rails_helper'

RSpec.feature 'UploadPictureOnAPosts', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit root_path
    fill_in 'post_title', with: 'Title'
    fill_in 'post_body', with: 'Body'
  end

  context 'valid file' do
    scenario 'upload picture on a post' do
      attach_file('post_images', Rails.root.join('spec/fixtures/files/sam.jpg'))
      click_on 'SAVE POST'

      expect(page).to have_css('img[src*="sam.jpg"]')
    end
  end

  context 'invalid file' do
    scenario 'upload other file type on a post' do
      attach_file('post_images', Rails.root.join('spec/fixtures/files/test.txt'))
      click_on 'SAVE POST'

      expect(page).to have_content('Images has an invalid content type')
    end
  end
end
