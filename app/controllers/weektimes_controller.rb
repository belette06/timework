# frozen_string_literal: true

# class WeektimesController < InheritedResources::Base
class WeektimesController < ApplicationController
  before_action :set_weektime, only: %i[show edit update destroy]

  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end

  # GET /weektimes or /weektimes.json
  def index
    @weektimes = if current_user.admin
                   Weektime.all
                 else
                   current_user.weektimes
                 end
  end

  # GET /weektimes/1
  def show
    @worktimes = @weektime.worktimes
    @weektime.workweek = 0

    @worktimes.each do |wo|
      @weektime.workweek = @weektime.workweek + wo.workday
    end
    @weektime.save
  end

  # GET /weektimes/new
  def new
    @weektime =current_user.weektimes.build
  end

  # GET /weektimes/1/edit
  def edit; end

  # POST /weektimes or /weektimes.json
  def create
    @weektime = current_user.weektimes.build(weektime_params)
    @weektime.workweek = 0

    respond_to do |format|
      if @weektime.save
        format.html { redirect_to weektime_url(@weektime), notice: "Ajout d'une feuille d'heure" }
        format.json { render :show, status: :created, location: @weektime }
      else
       # format.html { render :new, status: :unprocessable_entity }
       # format.json { render json: @weektime.errors, status: :unprocessable_entity }
       format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weektimes/1 or /weektimes/1.json
  def update
    respond_to do |format|
      if @weektime.update(weektime_params)
        format.html { redirect_to weektime_url(@weektime), notice: "mise à jour feuille d'heure." }
        format.json { render :show, status: :ok, location: @weektime }
      else
        #format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @weektime.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weektimes/1 or /weektimes/1.json
  def destroy
   

    respond_to do |format|
     if @weektime.destroy
      format.html { redirect_to root_path, notice: "Le broyeur c'est cool !!" }
      format.json { head :no_content }
     else
       format.html { redirect_to weektimes_url, notice: "Heure pas Supprimé" }
       format.json { render :show, status: :created, location: @weektime }
     end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weektime
    @weektime = Weektime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def weektime_params
    params.require(:weektime).permit(:user_id, :dateweek, :numsemaine, :workweek, :accord, worktime_id: [])
  end
end
