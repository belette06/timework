# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'weektimes/edit', type: :view do
  before(:each) do
    @weektime = assign(:weektime, Weektime.create!(
                                    user: nil,
                                    accord: false
                                  ))
  end

  it 'renders the edit weektime form' do
    render

    assert_select 'form[action=?][method=?]', weektime_path(@weektime), 'post' do
      assert_select 'input[name=?]', 'weektime[user_id]'

      assert_select 'input[name=?]', 'weektime[accord]'
    end
  end
end
