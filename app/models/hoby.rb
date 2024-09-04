class Hoby < ApplicationRecord
  has_and_belongs_to_many :profiles
  has_many :users, through: :profiles

  validates :name, presence: true
end
