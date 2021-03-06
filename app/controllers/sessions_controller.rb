class SessionsController < ApplicationController

    def new 
        if current_user
            redirect_to user_path(current_user)
        end
    end 

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:message] = "Email or password incorrect"
            redirect_to '/login'
        end
        
    end

    def facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |a|
            a.email = auth['info']['email']
            a.username = auth['info']['username']
            a.password = SecureRandom.hex
            a.uid = auth['uid']
        end
            session[:user_id] = @user.id
            redirect_to user_path(@user)
    end

    def destroy 
        session.delete(:user_id)
        redirect_to '/' 
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
end