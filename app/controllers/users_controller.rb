class UsersController < ApplicationController

    #http_basic_authenticate_with name: "test", password: "test", except: [:index, :new, :create]
  
    def index
        @users = User.all
    end

    def show
        if params[:id].to_i <=  User.count
            @user = User.find(params[:id])
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def list
        @users = User.all
    end

    private
        def user_params
            params.require(:user).permit(:name, :login, :password, :password_confirmation)
        end
end
