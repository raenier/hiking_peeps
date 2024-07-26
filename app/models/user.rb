class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes

  has_many :active_follows, class_name: 'Follow', foreign_key: :follower_id
  has_many :following, through: :active_follows, source: :followee
  has_many :passive_follows, class_name: 'Follow', foreign_key: :following_id
  has_many :followers, through: :passive_follows, source: :follower
  has_many :followed_posts, through: :following, source: :posts

  def full_name
    "#{first_name} #{second_name}"
  end

  def follow(user)
    following << user
  end
end
