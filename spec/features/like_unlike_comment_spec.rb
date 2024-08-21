require 'rails_helper'

RSpec.feature 'LikeUnlikeComments', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'like a comment' do
    comment = create(:comment)

    visit comment_path(comment)
    click_on 'Like'

    expect(page).to have_button('Unlike')
  end

  scenario 'unlike a comment' do
    comment = create(:comment, :with_like, user:)

    visit comment_path(comment)
    click_on 'Unlike'

    expect(page).to have_button('Like')
  end
end
