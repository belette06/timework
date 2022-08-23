# frozen_string_literal: true

class WorktimesController < WeektimesController
  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end

  before_action :set_worktime, only: %i[show edit update destroy]
  before_action :set_weektime, only: %i[show new edit create update destroy]
  after_action :flash_alert_message, except: :index

  # GET /worktimes 
  def index
    @worktimes = Worktime.all
  end

  ## GET /worktimes/1 
  # def show
  # end

  # GET new
  def new
    @worktime = @weektime.worktimes.build
    
  end

  # GET edit
  def edit; end

  # POST /worktimes 
  def create
   @worktime = @weektime.worktimes.build(worktime_params)
   days = params[:worktime][:daytime] 
   day_create = days.compact_blank.map do |day| 
                    { 
                      weektime_id:@worktime.weektime_id,
                      daytime:day,
                      gotime: @worktime.gotime,
                      endtime:@worktime.endtime,
                      workday: @worktime.workday = @worktime.endtime - @worktime.gotime,
                      affaire_id:@worktime.affaire_id,
                      created_at: Time.now, 
                      updated_at: Time.now 
                    } 
                   
   end
  
    respond_to do |format|
      unless params.permit(Worktime.insert_all(day_create))
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT 
  def update
    respond_to do |format|
      unless @worktime.update(worktime_params)
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worktimes/1 
  def destroy
    @worktime.destroy

    respond_to do |format|
      format.html { redirect_to weektime_url(@weektime), notice: 'Worktime was successfully destroyed.' }
      format.json { head :no_content }
    end
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

  # Only allow a list of trusted parameters through.
  def worktime_params
    params.require(:worktime).permit(:weektime_id, :gotime, :endtime, :workday, :accord, :affaire_id)
  end
end
