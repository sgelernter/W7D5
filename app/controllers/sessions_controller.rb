class SessionsController < ApplicationController

    before_action :require_logged_in, only: [:destroy]

    def new 
        render :login
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user 
            log_in!(@user)
            redirect_to user_url(@user)
        else 
            flash.now[:errors] = 'Invalid user credentials'
            render :login 
        end
    end

    def destroy 
        log_out! 
        render :login 
    end

end