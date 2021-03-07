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
            redirect_to '/login'
        end
            
    end
    
    def facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.email = auth['info']['email']
          u.password = SecureRandom.hex
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