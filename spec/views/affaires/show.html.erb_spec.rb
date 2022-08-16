# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'affaires/show', type: :view do
  before(:each) do
    @affaire = assign(:affaire, Affaire.create!(
                                  number: 2,
                                  client: 'Client',
                                  address: 'Address',
                                  title: 'Title',
                                  worktime: nil
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Client/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
