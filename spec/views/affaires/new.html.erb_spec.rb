# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'affaires/new', type: :view do
  before(:each) do
    assign(:affaire, Affaire.new(
                       number: 1,
                       client: 'MyString',
                       address: 'MyString',
                       title: 'MyString',
                       worktime: nil
                     ))
  end

  it 'renders new affaire form' do
    render

    assert_select 'form[action=?][method=?]', affaires_path, 'post' do
      assert_select 'input[name=?]', 'affaire[number]'

      assert_select 'input[name=?]', 'affaire[client]'

      assert_select 'input[name=?]', 'affaire[address]'

      assert_select 'input[name=?]', 'affaire[title]'

      assert_select 'input[name=?]', 'affaire[worktime_id]'
    end
  end
end
