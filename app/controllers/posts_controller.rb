class PostsController < ApplicationController

    def create
        @post = Post.create(user_id:session[:user_id], body:post_params[:body])
        redirect_to user_path(session[:user_id])
    end
    
    private
    def post_params
        params.require(:post).permit(:body)
    end

end
