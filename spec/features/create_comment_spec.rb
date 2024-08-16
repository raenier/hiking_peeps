require 'rails_helper'

RSpec.feature 'CreateCommentSpec.rbs', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'valid comment' do
    post = create(:post, user:)

    visit post_path(post)
    fill_in 'comment_body', with: 'Body'
    click_on 'COMMENT'

    expect(page).to have_content('Body')
    expect(page).to have_content(user.full_name)
  end
end
