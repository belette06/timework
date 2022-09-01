class DepannagesController < ApplicationController
  before_action :set_depannage, only: %i[show edit update destroy]

  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end

  def index
    @depannage = Depannage.page params[:page]
  end
  
  def show
  end 
  
  def new
    @depannage = Depannage.new
    @adresse = @depannage.build_adresse
  end

  def create
    @depannage = Depannage.create(params[depannage_params])
    @depannage.adresse_id = @depannage.build_adresse(adresse_params)

    respond_to do |format|
    
      if @depannage.save
       
        format.html { redirect_to depannage_url(@depannage), notice: 'depannage was successfully created.' }
        format.json { render :show, status: :created, location: @depannage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @depannage.errors, status: :unprocessable_entity }
      end
    end
  end  

  def edit
    if @depannage.adresse.nil?
      @adresse = @depannage.adresse 
    else
      @adresse = @depannage.build_adresse 
    end    
  end

  def update
    @depannage.update
    if @depannage.adresse.nil?
      @adresse = @depannage.build_adresse(adresse_params)
      @adresse.save
    else
      @adresse = @depannage.adresse.update(adresse_params)
    end
    respond_to do |format|
      if @depannage.update(depannage_params)
        format.html { redirect_to depannage_url(@depannage), notice: 'depannage was successfully updated.' }
        format.json { render :show, status: :ok, location: @depannage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @depannage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @depannage.destroy
    respond_to do |format|
      format.html { redirect_to depannages_url, notice: 'depannage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private 

  def set_depannage
    @depannage = Depannage.find(params[:id])
  end

  def depannage_params
    params.require(:depannage).permit( :title, :client, :number, :body, :closed, :adresse, worktimes:[])
  end

  def adresse_params
    params.require(:adresse).permit(:number, :street, :street2 , :zip, :city, :contry, :body)
  end
end
