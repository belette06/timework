# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'affaires/index', type: :view do
  before(:each) do
    assign(:affaires, [
             Affaire.create!(
               number: 2,
               client: 'Client',
               address: 'Address',
               title: 'Title',
               worktime: nil
             ),
             Affaire.create!(
               number: 2,
               client: 'Client',
               address: 'Address',
               title: 'Title',
               worktime: nil
             )
           ])
  end

  it 'renders a list of affaires' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Client'.to_s, count: 2
    assert_select 'tr>td', text: 'Address'.to_s, count: 2
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
