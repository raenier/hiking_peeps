class UsersController < ApplicationController

  def index
    @following = current_user.following
    @followers = current_user.followers
    @not_following = User.where.not(id: @following.ids << current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end
end
