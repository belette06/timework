class ProfilsController < ApplicationController
  
  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end

  def show
  end

  def new
    @profil = current_user.profile.build
  end

  def create
    @profil = current_user.profile.build(profile_param)
  end

  def edit
  end

  def update
    @profil.update(profile_param)
    respond_to edit_profile_path(@profil)
  end

  def destroy
    @profil.destroy(profile_param)
  end

  private

  def profile_param
    params.require(:profil).permit(:firstname, :lastname, :phone, :phone_supl)
  end

end
