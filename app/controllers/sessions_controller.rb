class SessionsController < ApplicationController
    def create
        if  User.find_by(login:login_params[:login])
            if User.find_by(login:login_params[:login]).password == login_params[:password]
                user = User.find_by(login:login_params[:login])
                session[:user_id] = user.id
                redirect_to user
            end
        end
    end
    private   
        def login_params
            params.require(:user).permit(:login, :password)
        end
end