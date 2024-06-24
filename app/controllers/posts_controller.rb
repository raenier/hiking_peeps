class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:user).where(user_id: current_user.following.ids << current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
