class Message < ApplicationRecord
  after_create_commit { broadcast_prepend_to room }

  belongs_to :user
  belongs_to :room
end
