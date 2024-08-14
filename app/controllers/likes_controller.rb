class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:id])
    current_user.like(post)

    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    current_user.unlike(post)

    redirect_to post
  end
end
