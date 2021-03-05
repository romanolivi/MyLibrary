class SessionsController < ApplicationController

    def new 
        if current_user
            redirect_to user_path(current_user)
        end
    end 

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:message] = "Username or password incorrect"
            redirect_to '/'
        end
    end

    def destroy 
        session.delete(:user_id)
        redirect_to '/' 
    end

end