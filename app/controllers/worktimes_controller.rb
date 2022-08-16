# frozen_string_literal: true

class WorktimesController < InheritedResources::Base
  private

  def worktime_params
    params.require(:worktime).permit(:weektime_id, :gotime, :endtime, :daytime, :workday, :accord)
  end
end
