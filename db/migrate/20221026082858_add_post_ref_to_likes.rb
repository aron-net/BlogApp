# frozen_string_literal: true

class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :posts, null: false, foreign_key: true
  end
end
