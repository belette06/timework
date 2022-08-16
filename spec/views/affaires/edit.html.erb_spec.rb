# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'affaires/edit', type: :view do
  before(:each) do
    @affaire = assign(:affaire, Affaire.create!(
                                  number: 1,
                                  client: 'MyString',
                                  address: 'MyString',
                                  title: 'MyString',
                                  worktime: nil
                                ))
  end

  it 'renders the edit affaire form' do
    render

    assert_select 'form[action=?][method=?]', affaire_path(@affaire), 'post' do
      assert_select 'input[name=?]', 'affaire[number]'

      assert_select 'input[name=?]', 'affaire[client]'

      assert_select 'input[name=?]', 'affaire[address]'

      assert_select 'input[name=?]', 'affaire[title]'

      assert_select 'input[name=?]', 'affaire[worktime_id]'
    end
  end
end
