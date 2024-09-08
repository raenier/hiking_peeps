require 'rails_helper'

RSpec.feature 'UploadProfilePictures', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit user_path(user)
  end

  context 'valid file' do
    scenario 'Upload profile picture' do
      attach_file('user_avatar', Rails.root.join('spec/fixtures/files/sam.jpg'))
      attach_file('user_cover_photo', Rails.root.join('spec/fixtures/files/sam.jpg'))
      click_on 'Update profile pictures'

      expect(page).to have_css('img[src*="sam.jpg"]', count: 2)
    end
  end

  context 'invalid file' do
    scenario 'Upload other file type' do
      attach_file('user_avatar', Rails.root.join('spec/fixtures/files/test.txt'))
      attach_file('user_cover_photo', Rails.root.join('spec/fixtures/files/test.txt'))
      click_on 'Update profile pictures'

      expect(page).to have_content('Avatar has an invalid content type')
      expect(page).to have_content('Cover photo has an invalid content type')
    end
  end
end
