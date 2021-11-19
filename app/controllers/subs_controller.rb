class SubsController < ApplicationController 

    helper_method :is_moderator?
    before_action :require_logged_in, only: [:new, :create, :edit, :update, :destroy]
    before_action :is_moderator?, only: [:edit, :update, :destroy]

    def is_moderator?
        sub = Sub.find(params[:id])
    end

    def index 
        @subs = Sub.all 
        render :index
    end

    def show 
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        render :new 
    end

    def create 
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save 
            redirect_to sub_url(@sub)
        else
            flash[:errors] = "Sub could not be created"
            render :index 
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update 
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            render :show
        else
            flash[:errors] = "Could not update sub"
            redirect_to subs_url
        end
    end

    def destroy
        @sub = Sub.find(params[:id])
        @sub.destroy
        render :index
    end

    private 

    def sub_params
        params[:sub].permit(:title, :description)
    end

end