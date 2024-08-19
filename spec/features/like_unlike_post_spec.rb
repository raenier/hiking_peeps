require 'rails_helper'

RSpec.feature 'LikeUnlikePosts', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'like a post' do
    post = create(:post, user:)
    visit post_path(post)
    click_on 'Like'

    expect(page).to have_content('1')
  end

  scenario 'unlike a post' do
    post = create(:post, user:)
    visit post_path(post)
    click_on 'Like'
    click_on 'Unlike'

    expect(page).to have_content('0')
  end
end
