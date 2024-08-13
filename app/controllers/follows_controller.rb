class FollowsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.follow(@user)

    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)

    redirect_to users_path
  end
end
