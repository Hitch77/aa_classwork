class UsersController < ApplicationController
    def new
        user = User.new
        render :new
    end

    def show
        user = User.find_by(id: params[:id])
    end

    def index
        @users = User.all
        render :index
    end

    def create
        user = User.new(user_params)
        if user.save
            login_user!(user)
            redirect_to users_url
        else
            flash[:errors] = ["User could not be created"]
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
