# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AffairesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/affaires').to route_to('affaires#index')
    end

    it 'routes to #new' do
      expect(get: '/affaires/new').to route_to('affaires#new')
    end

    it 'routes to #show' do
      expect(get: '/affaires/1').to route_to('affaires#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/affaires/1/edit').to route_to('affaires#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/affaires').to route_to('affaires#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/affaires/1').to route_to('affaires#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/affaires/1').to route_to('affaires#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/affaires/1').to route_to('affaires#destroy', id: '1')
    end
  end
end
