module Api
    module V1
        class PostsController < ApplicationController 
            def index
                posts = Post.where(user_id: params[:user_id])
                render json: posts, status: :ok
            end
            
            def show
                post = Post.where(id: params[:id])
                render json: post, status: :ok
            end
        end
    end
end   