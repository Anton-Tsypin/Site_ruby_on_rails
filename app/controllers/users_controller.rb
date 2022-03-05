class UsersController < ApplicationController
  
    def index
        @users = User.all
        session.clear
    end

    def show
        try = User.find_by(id:params[:id])
        if try
            if try.id == session[:user_id]
                @user = try
            else
                @user = try
            end
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(reg_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def list
        @users = User.all
    end

    private
        def reg_params
            params.require(:user).permit(:name, :login, :password, :password_confirmation)
        end
end
