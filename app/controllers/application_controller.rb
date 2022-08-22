# frozen_string_literal: true

class ApplicationController < ActionController::Base
  require 'pry'

  before_action do
    redirect_to root_path unless current_user
  end
  
end
