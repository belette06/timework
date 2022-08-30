class ProfilsController < ApplicationController
  before_action :set_profil, only: %i[show edit update destroy]

  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end



  def show


  end

  def new
    @profil = current_user.build_profil
    @adresse = @profil.build_adresse
  end

  def create
    @profil = current_user.build_profil(profil_params)
    @profil.adresse_id = @adresse.(adresse_params)
    #@profil.user_id = current_user

    respond_to do |format|
      if @profil.save
        format.html { redirect_to profil_url(@current_user), notice: 'profil was successfully created.' }
        format.json { render :show, status: :created, location: @profil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
  respond_to do |format|
    @adresse.update(adresse_params)
      if @profil.update(profil_params)
        format.html { redirect_to profil_url(@profil), notice: 'profil was successfully updated.' }
        format.json { render :show, status: :ok, location: @profil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profil.destroy
  end

  private

  def set_profil
      @profil = Profil.find(params[:id])     
  end

  def profil_params
    params.require(:profil).permit(:firstname, :lastname, :phone, :phone_supl, adresse_id: [:adresse_id, :number, :street, :street2 , :zip, :city, :contry, :body] )
  end

  def adresse_params
    params.require(:adresse).permit(:number, :street, :street2 , :zip, :city, :contry, :body)
  end
  
end
