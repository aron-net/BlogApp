class Post < ApplicationRecord
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy
  belongs_to :user
  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_comment
    comment.last(5)
  end

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
