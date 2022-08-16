# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'weektimes/index', type: :view do
  before(:each) do
    assign(:weektimes, [
             Weektime.create!(
               user: nil,
               accord: false
             ),
             Weektime.create!(
               user: nil,
               accord: false
             )
           ])
  end

  it 'renders a list of weektimes' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
