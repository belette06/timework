# frozen_string_literal: true

class WeektimesController < InheritedResources::Base
  private

  def weektime_params
    params.require(:weektime).permit(:user_id, :dateweek, :workweek, :accord)
  end
end
