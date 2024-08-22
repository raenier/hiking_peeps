require 'rails_helper'

RSpec.feature 'UpdateComments', type: :feature do
  let(:user) { create(:user) }
  let(:comment) { create(:comment, user:) }

  before do
    sign_in user
    visit comment_path(comment)
  end

  context 'valid comment' do
    scenario 'update comment' do
      click_on 'Edit'
      fill_in 'comment_body', with: 'Body updated'
      click_on 'COMMENT'

      expect(page).to have_content('Body updated')
    end
  end

  context 'invalid comment' do
    scenario 'update comment' do
      click_on 'Edit'
      fill_in 'comment_body', with: ''
      click_on 'COMMENT'

      expect(page).to have_content("Body can't be blank")
    end
  end
end
