# frozen_string_literal: true

json.extract! affaire, :id, :number, :client, :address, :title, :worktime_id, :created_at, :updated_at
json.url affaire_url(affaire, format: :json)
