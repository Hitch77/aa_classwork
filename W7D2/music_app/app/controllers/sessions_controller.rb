class SessionsController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            log_in(@user)
            redirect_to "/users"
        else 
            render :json
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    def new
        render :new
    end
end
