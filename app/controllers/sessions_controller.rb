class SessionsController < ApplicationController

    def new 
        if current_user 
            redirect_to user_path(current_user)
        end
    end 

    def create
        if auth 
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id

            redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                redirect_to '/login'
            end
       
        end
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