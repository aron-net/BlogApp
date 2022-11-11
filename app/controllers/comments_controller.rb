class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = @post

    respond_to do |format|
      format.html do
        if comment.save
          redirect_to user_post_path(@user.id, @post.id)
        else
          flash[:notice] = "Error: Couldn't create comment"
          render :new, locals: { comment: }
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.post.decrement!(:comments_counter)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back_or_to user_posts_path(current_user), notice: 'Deleted!' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
