require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_and_belong_to_many(:hobies) }

  it { is_expected.to validate_presence_of(:bday) }
end
