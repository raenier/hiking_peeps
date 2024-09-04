require 'rails_helper'

RSpec.describe Hoby, type: :model do
  it { is_expected.to have_and_belong_to_many(:profiles) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }
end
