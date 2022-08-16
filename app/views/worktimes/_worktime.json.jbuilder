# frozen_string_literal: true

json.extract! worktime, :id, :weektime_id, :gotime, :endtime, :daytime, :workday, :accord, :created_at, :updated_at
json.url worktime_url(worktime, format: :json)
