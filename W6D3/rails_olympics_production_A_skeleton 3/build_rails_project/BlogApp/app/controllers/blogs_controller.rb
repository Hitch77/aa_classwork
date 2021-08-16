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

    def create
        blog = Blog.new(blog_params)
        if blog.save
            redirect_to blogs_url
        else
            render :new
        end
    end

    def destroy
        blog = Blog.find_by(id: params[:id])
        if blog.destroy
            redirect_to blogs_url
        else
            render json: {error: "There is no blog with that id!"}
        end
    end


    private
    def blog_params
        params.require(:blog).permit(:title, :body, :author_id)
    end
end
