# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'worktimes/show', type: :view do
  before(:each) do
    @worktime = assign(:worktime, Worktime.create!(
                                    weektime: nil,
                                    accord: false
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
