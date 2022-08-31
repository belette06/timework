# frozen_string_literal: true

class AffairesController < ApplicationController
  before_action :set_affaire, only: %i[show edit update destroy]

  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end

  def index
    @affaires = Affaire.page params[:page] 
  end

  def show
  
    @afpg= @affaire.worktimes.page params[:page] 

  
    @affaire.workaffaire = 0
    @affaire.worktimes.each do |work| 
       @affaire.workaffaire = @affaire.workaffaire + work.workday
    end
    @affaire.save
  end

  def new
    @affaire = Affaire.new
    @adresse = @affaire.build_adresse
  end

  # GET /affaires/1/edit
  def edit
    if @affaire.adresse.nil?
       @adresse = @affaire.adresse 
    else
       @adresse = @affaire.build_adresse 
    end
  end

  def create
    @affaire = Affaire.new(affaire_params)
    @affaire.adresse_id = @affaire.build_adresse(adresse_params)

    respond_to do |format|
    
      if @affaire.save
       
        format.html { redirect_to affaire_url(@affaire), notice: 'affairee was successfully created.' }
        format.json { render :show, status: :created, location: @affaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @affaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affaires/1 or /affaires/1.json
  def update
    if @affaire.adresse.nil?
       @adresse = @affaire.build_adresse(adresse_params)
       @adresse.save
    else
       @adresse = @affaire.adresse.update(adresse_params)
    end

    respond_to do |format|
      if @affaire.update(affaire_params)
        format.html { redirect_to affaire_url(@affaire), notice: 'affaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @affaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @affaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affaires/1 or /affaires/1.json
  def destroy
    @affaire.destroy

    respond_to do |format|
      format.html { redirect_to affaires_url, notice: 'affaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_affaire
    @affaire = Affaire.find(params[:id])
  end

  def affaire_params
    params.require(:affaire).permit(:number, :client,  :title, :workaffaire,adresse_id: [:adresse_id, :number, :street, :street2 , :zip, :city, :contry, :body] , worktime_ids: [])
  end

  
  def adresse_params
    params.require(:adresse).permit(:number, :street, :street2 , :zip, :city, :contry, :body)
  end
end
