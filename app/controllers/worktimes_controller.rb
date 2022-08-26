# frozen_string_literal: true

class WorktimesController < WeektimesController
  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end
  before_action :toggle, only: %i[update]
  before_action :set_worktime, only: %i[edit update destroy]
  before_action :set_weektime, only: %i[new edit create update destroy]
  after_action :flash_alert_message, except: :index


  # GET new
  def new
    @worktime = @weektime.worktimes.build
    
  end

  # GET edit
  def edit; end

  # POST /worktimes 
  def create
   @worktime = @weektime.worktimes.build(worktime_params)

    respond_to do |format|
      if @worktime.save
      format.html { redirect_to weektime_url(@weektime), notice: "Ajout de l'heure" }
       format.json { render :show, status: :created, location: @weektime }
      
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT 
  def update
    respond_to do |format|
      
      if @worktime.update(worktime_params)
        format.html { redirect_to weektime_url(@weektime), notice: "update de l'heure" }
         format.json { render :show, status: :show, location: @weektime }
        
        else
          format.turbo_stream { render :edit, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /worktimes/1 
  def destroy
    @worktime.destroy

    respond_to do |format|
     # format.html { redirect_to weektime_url(@weektime), notice: "Heure Supprimé" }
     # format.json { render :show, status: :created, location: @weektime }
    end
  end

  def toggle
    @worktime = Worktime.find(params[:id])
    @worktime.update(accord: params[:accord])
  
    render json: { message: "Success" }
  end

  

  private


 
  def flash_alert_message
    return unless @worktime.flash_alert_message.present?

    flash[:alert] = @worktime.flash_alert_message
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_worktime
    @worktime = Worktime.find(params[:id])
  end

  def set_weektime
    @weektime = Weektime.find(params[:weektime_id])
  end

  def worktime_update_params
    params.require(:worktime).permit(:weektime_id, :gotime, :endtime,:workday, :accord, :affaire_id, :daytime)
  end
  

  # Only allow a list of trusted parameters through.
  def worktime_params
    params.require(:worktime).permit(:weektime_id, :gotime, :endtime,:workday, :accord, :affaire_id, dayrecords:[] )
  end
end
