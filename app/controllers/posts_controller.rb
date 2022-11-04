class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
