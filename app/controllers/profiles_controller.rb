class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Profile was successfully updated.'
      redirect_to @profile
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:description, :gender, :bday, :address)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
