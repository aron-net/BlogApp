class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comment: [:user])
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = @post.comment
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    respond_to do |format|
      format.html do
        if post.save
          redirect_to user_posts_path(current_user.id), notice: 'Post successfully created'
        else
          flash.now[:notice] = "Error: Couldn't create post"
          render :new, locals: { post: }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.user.decrement!(:posts_counter)
    @post.destroy
    respond_to do |format|
      format.html { redirect_back_or_to user_path(current_user), notice: 'Deleted!' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
