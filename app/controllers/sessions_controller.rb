class SessionsController < ApplicationController
    def create
        if  User.find_by(login:login_params[:login])
            user = User.find_by(login:login_params[:login])
            session[:user_id] = user.id 
            redirect_to user
        end
    end
    def show
        @user = User.find(params[:id])
    end
    private   
        def login_params
            params.require(:user).permit(:login, :password)
        end
end