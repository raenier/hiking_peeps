class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(user: current_user)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post was successfully created.'
    else
      flash[:alert] = 'Post was not created.'
      flash[:errors] = @post.errors.full_messages.join(', ')
    end

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to @post
    else
      flash[:alert] = 'Post was not updated.'
      flash[:errors] = @post.errors.full_messages.join(', ')
    end
  end

  def destroy
    flash[:notice] = 'Post was successfully deleted.' if Post.find(params[:id]).destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
