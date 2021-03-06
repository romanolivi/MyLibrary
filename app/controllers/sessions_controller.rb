class SessionsController < ApplicationController

    def new 
        if current_user
            redirect_to user_path(current_user)
        else 
            @user = User.new
        end
    end 

    def create
        if auth 
            @user = User.find_or_create_by(uid: auth['uid']) do |a|
                a.email = auth['info']['email']
                a.password = SecureRandom.hex
            end

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

    def github
        auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id 
            redirect_to user_path(user)
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