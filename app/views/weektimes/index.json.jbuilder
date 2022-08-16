# frozen_string_literal: true

json.array! @weektimes, partial: 'weektimes/weektime', as: :weektime
