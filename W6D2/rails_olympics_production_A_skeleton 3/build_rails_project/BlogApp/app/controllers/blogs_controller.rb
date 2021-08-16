class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
        render :index 
    end

    def show
        @blog = Blog.find_by(id: params[:id])
        if @blog
            render :show
        else
            render json: {error: "There is no blog with that id!"}
        end
    end
end
