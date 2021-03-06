class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new 
        if logged_in?
            redirect_to user_path(current_user)
        else 
            @user = User.new 
        end
    end 

    def create 
        @user = User.new(user_params)

        if @user.save && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:message] = "Email or Password incorrect. Try again"
            render :new
        end
    end 

    def show 
        @user = current_user
    end 

    private 

    def user_params
        params.permit(:email, :username, :password)
    end

    def require_login 
        redirect_to '/' unless session.include? :user_id
    end
end
