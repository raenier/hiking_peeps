class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts
  has_many :comments
  has_many :likes
  has_one :profile
  has_many :hobies, through: :profile

  has_many :active_follows, class_name: 'Follow', foreign_key: :follower_id
  has_many :following, through: :active_follows, source: :followee
  has_many :passive_follows, class_name: 'Follow', foreign_key: :following_id
  has_many :followers, through: :passive_follows, source: :follower
  has_many :followed_posts, through: :following, source: :posts

  has_one_attached :avatar
  has_one_attached :cover_photo

  validates :first_name, :second_name, presence: true
  validates :avatar, content_type: %i[png jpg jpeg]
  validates :cover_photo, content_type: %i[png jpg jpeg]

  accepts_nested_attributes_for :profile

  after_initialize :build_profile, if: -> { new_record? && profile.nil? }

  def full_name
    "#{first_name} #{second_name}"
  end

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end

  def like(likeable)
    likes.create(likeable:, user: self)
  end

  def unlike(likeable)
    likes.find_by(likeable_id: likeable.id).destroy
  end

  def liked?(likeable)
    likes.find_by likeable:
  end

  def posts_feed
    Post.where(user: following).or(Post.where(user: self)).order(created_at: :desc)
  end
end
