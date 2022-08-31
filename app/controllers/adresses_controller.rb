class AdressesController < ApplicationController
  before_action :set_adresse, only: %i[show edit update destroy]

  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end

  
  def new
    @adresse = Adresse.new
  end

  def create
    @adresse = Adresse.new(adresse_params)
    
    if @adresse.save
      flash[:notice] = 'Adresse was successfully created.'
    else
      flash[:error] = "Adresse could not be created"
    end
  end

  def edit
  end

  def update
    if @adresse.update(adresse_params)
      flash[:notice] = 'Adresse was successfully updated.'
    else
      flash[:error] = "Adresse could not be updated"
    end
  end

  def destroy
    @adresse.destroy
    flash[:notice] = 'Adresse was successfully destroyed.'
   
  end

  private

  def set_adresse
    @adresse = Adresse.find(params[:id])
  end

  def params_adresse
    params.require(:adresse).permit(:number, :street, :street2 , :zip, :city, :contry, :body, )
  end
end
