# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'weektimes/show', type: :view do
  before(:each) do
    @weektime = assign(:weektime, Weektime.create!(
                                    user: nil,
                                    accord: false
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
