class User < ApplicationRecord
  has_many :post, foreign_key: 'user_id'
  has_many :comment, foreign_key: 'user_id'
  has_many :like, foreign_key: 'user_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    post.order(created_at: :desc).limit(3)
  end
end
