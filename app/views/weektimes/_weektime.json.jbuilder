# frozen_string_literal: true

json.extract! weektime, :id, :user_id, :dateweek, :workweek, :accord, :created_at, :updated_at
json.url weektime_url(weektime, format: :json)
