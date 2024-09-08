class LikesController < ApplicationController
  def create
    likeable = params[:likeable_type].constantize.find(params[:id])
    current_user.like(likeable)

    redirect_to likeable
  end

  def destroy
    likeable = params[:likeable_type].constantize.find(params[:id])
    current_user.unlike(likeable)

    redirect_to likeable
  end
end
