class UsersController < ApplicationController
  
    def index
    end

    def show
        @user = User.find_by(id:params[:id])
        @posts = @user.posts.order(created_at: :desc).page params[:page]
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(reg_params)
        if @user.save
            session.clear
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
    
        if @user.update(reg_params)
          redirect_to @user
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        if User.find_by(id:params[:id]).id == session[:user_id]
            @user = User.find(params[:id])
            @user.destroy
    
            redirect_to root_path
        end
    end

    def list
        @users = User.all.page params[:page]
    end

    private
        def reg_params
            params.require(:user).permit(:name, :role, :login, :password, :password_confirmation)
        end
end
