require 'rails_helper'

RSpec.feature 'DeleteComments', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit comment_path(comment)
  end

  context 'Own comment' do
    let(:comment) { create(:comment, user:) }
    scenario 'delete comment' do
      accept_confirm do
        click_on 'Delete'
      end

      expect(page).to have_content('Comment was successfully deleted.')
      expect(page).not_to have_content(comment.body)
    end
  end

  context 'Others comment' do
    let(:comment) { create(:comment) }

    scenario 'cannot delete comment' do
      expect(page).not_to have_content('Delete')
    end
  end
end
