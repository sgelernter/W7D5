class UsersController < ApplicationController 

    before_action :require_logged_in, only: [:index, :show, :edit, :update, :destroy]

    def new
        render :register
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            log_in!(@user)
            redirect_to user_url(@user)
        else 
            flash.now[:errors] = 'Invalid username or password'
            render :register 
        end
    end

    def index 
        @users = User.all 
        render :index 
    end

    def show 
        @user = User.find(params[:id])
        render :show
    end

    # def edit 
    #     @user = User.find(params[:id])
    #     redirect_to edit_user_url(@user)
    # end

    # def update 
    #     @user = User.find_by(params[:id])
    #     @user.username = params[:user][:username]
    #     @user.password = params[:user][:password]
    #     if @user.save 
    #         redirect_to user_url(@user)
    #     else 
    #         flash[:errors] = "Those changes won't work"
    #         redirect_to edit_user_url(@user)
    #     end
    # end

    def destroy
        @user = User.find_by(params[:id])
        @user.destroy 
        redirect_to new_session_url
    end

    private 

    def user_params 
        params[:user].permit(:username, :password)
    end

end