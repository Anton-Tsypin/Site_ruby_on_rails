class UsersController < ApplicationController

    #http_basic_authenticate_with name: "test", password: "test", except: [:index, :new, :create]
  
    def index
        @users = User.all
    end

    def show
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
        if params[:id].to_i <=  User.count
            @user = User.find(params[:id])
        end 
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(reg_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user #root_path, notice: "Successfully created account!"
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
