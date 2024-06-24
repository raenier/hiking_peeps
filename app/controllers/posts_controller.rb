class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user_id: current_user.following.ids << current_user.id)
  end
end
