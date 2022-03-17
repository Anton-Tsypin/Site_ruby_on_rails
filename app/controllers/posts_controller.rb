class PostsController < ApplicationController

    def index
        @posts = Post.order(created_at: :desc).page params[:page]
    end

    def create
        @post = Post.create(user_id:session[:user_id], body:post_params[:body], title:post_params[:title])
        redirect_to user_path(session[:user_id])
    end
    
    def show
        @post = Post.find_by(id:params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
          redirect_to @post
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if Post.find_by(id:params[:id]).user_id == session[:user_id]
            @post = Post.find(params[:id])
            @post.destroy
    
            redirect_to root_path
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end

end
