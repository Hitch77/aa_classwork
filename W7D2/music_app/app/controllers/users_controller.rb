class UsersController < ApplicationController
    before_action :require_logged_out, only: [:create, :new]
    # before_action :require_logged_in, only: [:index]

    def index 
        @users = User.all
        render :index
    end

    def create
        @user = User.new(user_params)
        if @user.save!
            log_in(@user)
            redirect_to users_url
        else
            fail
        end
    end

    def new
        @user = User.new
        render :new
    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
