# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'worktimes/edit', type: :view do
  before(:each) do
    @worktime = assign(:worktime, Worktime.create!(
                                    weektime: nil,
                                    accord: false
                                  ))
  end

  it 'renders the edit worktime form' do
    render

    assert_select 'form[action=?][method=?]', worktime_path(@worktime), 'post' do
      assert_select 'input[name=?]', 'worktime[weektime_id]'

      assert_select 'input[name=?]', 'worktime[accord]'
    end
  end
end
