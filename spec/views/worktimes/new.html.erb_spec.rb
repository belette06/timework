# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'worktimes/new', type: :view do
  before(:each) do
    assign(:worktime, Worktime.new(
                        weektime: nil,
                        accord: false
                      ))
  end

  it 'renders new worktime form' do
    render

    assert_select 'form[action=?][method=?]', worktimes_path, 'post' do
      assert_select 'input[name=?]', 'worktime[weektime_id]'

      assert_select 'input[name=?]', 'worktime[accord]'
    end
  end
end
