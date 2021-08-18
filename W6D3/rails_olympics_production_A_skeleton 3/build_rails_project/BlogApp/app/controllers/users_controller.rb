class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to blogs_url
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email)
    end
end
