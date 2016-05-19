class CommentsController < ApplicationController
	before_action :is_authenticated?
  before_action :current_user
	
  def create
  	@comment = @current_user.comment.create comment_params
  	render :json => @comment
  end

  def destroy
  	Comment.find(params[:id]).delete
  end

  def upvote
    @comment.upvote_from current_user
    redirect_to solutions_path
  end

  def downvote
    @comment.downvote_from current_user
    redirect_to solutions_path
  end

end
