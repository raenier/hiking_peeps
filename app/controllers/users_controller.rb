class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @following = current_user.following
    @followers = current_user.followers
    @not_following = User.where.not(id: @following.ids << current_user.id)
  end
end
