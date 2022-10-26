class User < ApplicationRecord
    has_many :post, foreign_key: 'user_id'
    has_many :comment, foreign_key: 'user_id'
    has_many :like, foreign_key: 'user_id'

    def recent_posts
        post.order(created_at: :desc).limit(3)
    end    
end
