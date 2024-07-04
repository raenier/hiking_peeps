require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:active_follows) }
    it { is_expected.to have_many(:following) }
    it { is_expected.to have_many(:passive_follows) }
    it { is_expected.to have_many(:followers) }
  end

  describe '#full_name' do
    subject(:user) { User.new(first_name: 'John', second_name: 'Doe') }

    it { expect(user.full_name).to eq('John Doe') }
  end
end
