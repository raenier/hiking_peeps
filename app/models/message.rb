class Message < ApplicationRecord
  after_create_commit { broadcast_append_to room, target: 'message_list' }

  belongs_to :user
  belongs_to :room

  validates :body, presence: true
end
