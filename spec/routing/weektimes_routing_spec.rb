# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeektimesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/weektimes').to route_to('weektimes#index')
    end

    it 'routes to #new' do
      expect(get: '/weektimes/new').to route_to('weektimes#new')
    end

    it 'routes to #show' do
      expect(get: '/weektimes/1').to route_to('weektimes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/weektimes/1/edit').to route_to('weektimes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/weektimes').to route_to('weektimes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/weektimes/1').to route_to('weektimes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/weektimes/1').to route_to('weektimes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/weektimes/1').to route_to('weektimes#destroy', id: '1')
    end
  end
end
