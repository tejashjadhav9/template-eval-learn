class PostsController < ApplicationController
    def index
        @posts=Post.all
    end
    
    def new
        @post=Post.new
        @users= User.all
    end

    def create
        @post=Post.new(post_details)
        if @post.save
         redirect_to @post
        else
         render :new ,status: :unprocessable_entity
        end
    end

    def show
        @post=User.find(params[:id]).posts
    end

    private
    def post_details
        params.require(:post).permit(:user_id,:post)
    end

end
