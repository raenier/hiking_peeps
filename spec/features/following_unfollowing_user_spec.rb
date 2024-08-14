require 'rails_helper'

RSpec.feature 'FollowingUnfollowingUsers', type: :feature do
  before do
    sign_in user
  end

  context 'without followed user' do
    let(:user) { create(:user) }
    let!(:other_user) { create(:user) }

    scenario 'follow a user', js: true do
      visit users_path

      user = find("#user_#{other_user.id}")
      user.click_button 'Follow'

      within '#following' do
        expect(page).to have_content('Unfollow')
      end
      within '#not_followed' do
        expect(page).not_to have_content('Follow')
      end
    end
  end

  context 'with followed user' do
    let(:user) { create(:user, :with_following) }
    let(:other_user) { user.following.first }

    scenario 'unfollow a user', js: true do
      visit users_path

      user = find("#user_#{other_user.id}")
      user.click_button 'Unfollow'

      within '#following' do
        expect(page).not_to have_content('Unfollow')
      end
      within '#not_followed' do
        expect(page).to have_content('Follow')
      end
    end
  end

  context 'with follower' do
    let(:user) { create(:user, :with_follower) }
    let(:other_user) { user.followers.first }

    it 'shows user on followers list' do
      visit users_path

      within '#followers' do
        expect(page).to have_content(other_user.full_name)
      end
      within '#not_followed' do
        expect(page).to have_content(other_user.full_name)
      end
    end
  end
end
