class PostsController < ApplicationController

    def create
        @user = User.find(params[:id])
        if @user.id == session[:user_id]
            @user = User.find(params[:id])
            @post = @user.posts.create(post_params)
            redirect_to user_path(@user)
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:body)
    end

end
