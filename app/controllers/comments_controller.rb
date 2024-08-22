class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[index new create]

  def index
    @comments = Comment.where(commentable_type: 'Post', commentable: @post).order(created_at: :desc)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(commentable: @post, user: current_user)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.commentable = @post
    @comment.user = current_user
    if @comment.save
      flash.now[:notice] = 'Comment was successfully created.'
      respond_to(&:turbo_stream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to @comment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless @comment.destroy

    flash[:notice] = 'Comment was successfully deleted.'
    redirect_to @comment.commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
