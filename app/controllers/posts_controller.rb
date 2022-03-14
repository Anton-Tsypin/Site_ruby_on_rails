class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def create
        @post = Post.create(user_id:session[:user_id], body:post_params[:body], title:post_params[:title])
        redirect_to user_path(session[:user_id])
    end
    
    def show
        @post = Post.find_by(id:params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end

end
