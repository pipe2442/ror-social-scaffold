class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000,
                                                too_long: '1000 characters in post is the maximum allowed.' }

  belongs_to :user

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :filter_by_user, ->(user_id) { where user_id: user_id }
  scope :filter_by_friend, ->(friend_id) { where friend_id: friend_id }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
