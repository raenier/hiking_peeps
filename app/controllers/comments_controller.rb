class CommentsController < ApplicationController
  def index
    @comments = Comment.where(commentable_type: 'Post', commentable_id: params[:id])
  end
end
