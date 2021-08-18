class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        if comment.save
            redirect_to blog_url(comment.blog_id)
        else
            redirect_to blog_url(comment.blog_id)
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment.delete
            redirect_to blog_url(comment.blog_id)
        end 
    end

    def comment_params
        params.require(:comment).permit(:body, :author_id, :blog_id)
    end
end
