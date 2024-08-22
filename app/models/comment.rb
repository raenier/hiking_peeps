class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :likes, as: :likeable

  validates :body, presence: true
end
