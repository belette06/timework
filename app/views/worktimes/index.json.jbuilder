# frozen_string_literal: true

json.array! @worktimes, partial: 'worktimes/worktime', as: :worktime
