class AdminController < ApplicationController

  before_action do
    redirect_to new_user_session_path unless current_user.admin?
  end

  def index
  end

  def users
    @users = User.all.includes(:weektimes)
  end

  def show_user
    @user = User.all.includes(:weektimes).find(params[:id])
  end

  def weektimes
    @weektimes = Weektime.all.includes(:user, :worktimes)
  end

  def show_weektime
    @weektime = Weektime.includes(:user, :worktimes).find(params[:id])
  end

  def affaires
    @affaires = Affaire.all
    @worktimes = Affaire.all.includes(:worktimes)
  end

  def show_affaire
    @affaire = Affaire.includes(:worktimes).find(params[:id])
  end
end
