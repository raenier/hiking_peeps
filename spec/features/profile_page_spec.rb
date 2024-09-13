require 'rails_helper'

RSpec.feature 'ProfilePages', type: :feature do
  let(:user) { create(:user) }
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

  scenario 'update profile' do
    visit user_path(user)

    click_on 'Edit'

    fill_in 'profile_description', with: 'Description updated'
    select 'male', from: 'profile_gender'
    fill_in 'profile_bday', with: '2020-01-01'
    fill_in 'profile_address', with: 'Address updated'
    click_on 'SAVE PROFILE'

    expect(page).to have_content('Description updated')
    expect(page).to have_content('male')
    expect(page).to have_content('2020-01-01')
    expect(page).to have_content('Address updated')
  end

  scenario 'invalid profile' do
    visit user_path(user)

    click_on 'Edit'

    fill_in 'profile_bday', with: ''
    click_on 'SAVE PROFILE'

    expect(page).to have_content("Bday can't be blank")
  end
end
