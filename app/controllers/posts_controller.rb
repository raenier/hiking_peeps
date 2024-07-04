class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:user).where(user_id: current_user.following.ids << current_user.id)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
