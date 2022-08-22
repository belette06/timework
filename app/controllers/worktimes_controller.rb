# frozen_string_literal: true

class WorktimesController < WeektimesController
  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user
  end

  before_action :set_worktime, only: %i[show edit update destroy]
  before_action :set_weektime, only: %i[show new edit create update destroy]
  after_action :flash_alert_message, except: :index
  # GET /worktimes or /worktimes.json
  def index
    @worktimes = Worktime.all
  end

  ## GET /worktimes/1 or /worktimes/1.json
  # def show
  # end

  # GET /worktimes/new
  def new
    @worktime = @weektime.worktimes.build
  end

  # GET /worktimes/1/edit
  def edit; end

  # POST /worktimes or /worktimes.json
  def create
    @worktime = @weektime.worktimes.build(worktime_params)

    respond_to do |format|
      if @worktime.save
        format.html { redirect_to weektime_url(@weektime), notice: 'Worktime was successfully created.' }
        # format.json { render :show, status: :created, location: @weektime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worktime.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /worktimes/1 or /worktimes/1.json
  def update
    respond_to do |format|
      if @worktime.update(worktime_params)

        format.html { redirect_to weektime_url(@weektime), notice: 'Worktime was successfully updated.' }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worktimes/1 or /worktimes/1.json
  def destroy
    @worktime.destroy

    respond_to do |format|
      format.html { redirect_to weektime_url(@weektime), notice: 'Worktime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def flash_alert_message
    return unless @worktime.flash_alert_message.present?

    flash[:alert] = @worktime.flash_alert_message
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_worktime
    @worktime = Worktime.find(params[:id])
  end

  def set_weektime
    @weektime = Weektime.find(params[:weektime_id])
  end

  # Only allow a list of trusted parameters through.
  def worktime_params
    params.require(:worktime).permit(:weektime_id, :gotime, :endtime, :daytime, :workday, :accord, :affaire_id)
  end
end
