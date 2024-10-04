class Room < ApplicationRecord
  after_create_commit { broadcast_prepend_to 'rooms' }

  has_many :messages

  validates :name, presence: true
end
