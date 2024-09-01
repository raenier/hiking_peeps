require 'rails_helper'

RSpec.feature 'UploadPictureOnAPosts', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'upload picture on a post' do
    visit root_path
    fill_in 'post_title', with: 'Title'
    fill_in 'post_body', with: 'Body'

    attach_file('post_images', Rails.root.join('spec/fixtures/files/sam.jpg'))
    click_on 'SAVE POST'

    expect(page).to have_css('img[src*="sam.jpg"]')
  end
end
