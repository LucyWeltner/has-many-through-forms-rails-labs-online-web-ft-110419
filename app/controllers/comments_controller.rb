class CommentsController < ApplicationController

  def create
    comment = Comment.new(params.require(:comment).permit(:content, :post_id, :user_id))
    if !comment.user_id
    	comment.update(comment_params)
    end
    if comment.save
    	redirect_to post_path(comment.post)
    else
    	render :'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
