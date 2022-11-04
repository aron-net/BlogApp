class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
