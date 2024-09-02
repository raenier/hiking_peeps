class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many_attached :images

  validates :title, :body, presence: true
  validates :images, content_type: %i[png jpg jpeg]
end
