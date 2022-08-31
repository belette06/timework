class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy]

  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end



  def show


  end

  def new
    @profile = current_user.build_profile
    @adresse = @profil.build_adresse
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.adresse_id = @profile.build_adresse(adresse_params)
    #@profil.user_id = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@current_user), notice: 'profile est crée avec succes.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; 
    if @profile.adresse.nil?
      @adresse = @profile.adresse 
    else
      @adresse = @profile.build_adresse 
    end
  end  

  def update
        if @profile.adresse.nil?
           @adresse = @profile.build_adresse(adresse_params)
           @adresse.save
        else
           @adresse = @profile.adresse.update(adresse_params)
        end

  respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: 'profil mis à jour.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
  end


  private

  def set_profile
      @profile= Profile.find(params[:id])     
  end

  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :phone, :phone_supl, :job ,adresse_id: [:number, :street, :street2 , :zip, :city, :contry, :body]  )
  end

  def adresse_params
    params.require(:adresse).permit(:number, :street, :street2 , :zip, :city, :contry, :body)
  end
  
end
