class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def index
    @following = current_user.following
    @followers = current_user.followers
    @not_following = User.where.not(id: @following.ids << current_user.id)
  end

  def show; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Profile was successfully updated.'
      redirect_to @user
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :second_name, :avatar, :cover_photo)
  end
end
