class AdminController < ApplicationController
  def index
  end

  def users
  end

  def weektimes
    @weektimes = Weektime.all.includes(:user, :worktimes)
  end

  def show_weektime
    @weektime = Weektime.includes(:user, :worktimes).find(params[:id])
  end

  def affaires
  end
end
