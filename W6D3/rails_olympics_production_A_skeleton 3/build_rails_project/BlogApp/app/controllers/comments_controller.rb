class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        if comment.save
            redirect_to controller: 'blogs', action: 'show', id: blog_id
        else
            render :show
        end

    end

    def comment_params
        params.require(:comment).permit(:body, :author_id, :blog_id)
    end
end
