class Profile < ApplicationRecord
  enum gender: { female: 0, male: 1, other: 2 }

  belongs_to :user
  has_and_belongs_to_many :hobies

  validates :gender, :bday, presence: true
end
