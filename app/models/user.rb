class User < ApplicationRecord
  has_many :post, foreign_key: 'user_id', dependent: :destroy
  has_many :comment, foreign_key: 'user_id', dependent: :destroy
  has_many :like, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    post.last(3)
  end
end
