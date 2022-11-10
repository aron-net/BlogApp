class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @like = Like.new
    @like.user = current_user_admin
    @like.post = @post

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
