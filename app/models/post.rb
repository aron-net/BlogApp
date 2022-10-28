class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :user
  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_comments
    comments.last(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
