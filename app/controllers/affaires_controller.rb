# frozen_string_literal: true

class AffairesController < InheritedResources::Base
  private

  def affaire_params
    params.require(:affaire).permit(:number, :client, :address, :title, :worktime_id)
  end
end
