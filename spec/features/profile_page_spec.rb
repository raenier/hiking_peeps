require 'rails_helper'

RSpec.feature 'ProfilePages', type: :feature do
  let(:user) { create(:user, :with_profile) }
  let(:profile) { user.profile }

  before do
    sign_in user
  end

  scenario 'visit profile page' do
    visit root_path
    click_on 'Profile'

    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(profile.description)
    expect(page).to have_content(profile.gender)
    expect(page).to have_content(profile.bday)
    expect(page).to have_content(profile.address)
  end
end
