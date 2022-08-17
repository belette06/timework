# frozen_string_literal: true

#class WeektimesController < InheritedResources::Base
 class WeektimesController < ApplicationController
  before_action :set_weektime, only: %i[show edit update destroy]

  before_action only: %i[new edit] do
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

  # GET /weektimes/1 or /weektimes/1.json
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
    @weektime = Weektime.new
  end

  # GET /weektimes/1/edit
  def edit; end

  # POST /weektimes or /weektimes.json
  def create
    @weektime = Weektime.new(weektime_params)
    @weektime.user_id = current_user.id
    @weektime.workweek = 0

    respond_to do |format|
      if @weektime.save
        format.html { redirect_to weektime_url(@weektime), notice: 'Weektime was successfully created.' }
        format.json { render :show, status: :created, location: @weektime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weektime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weektimes/1 or /weektimes/1.json
  def update
    respond_to do |format|
      if @weektime.update(weektime_params)
        format.html { redirect_to weektime_url(@weektime), notice: 'Weektime was successfully updated.' }
        format.json { render :show, status: :ok, location: @weektime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weektime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weektimes/1 or /weektimes/1.json
  def destroy
    @weektime.destroy

    respond_to do |format|
      format.html { redirect_to weektimes_url, notice: 'Weektime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weektime
    @weektime = Weektime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def weektime_params
    params.require(:weektime).permit(:user_id, :dateweek, :workweek, :accord, worktime_id: [])
  end
end
