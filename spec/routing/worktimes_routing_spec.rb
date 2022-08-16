# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorktimesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/worktimes').to route_to('worktimes#index')
    end

    it 'routes to #new' do
      expect(get: '/worktimes/new').to route_to('worktimes#new')
    end

    it 'routes to #show' do
      expect(get: '/worktimes/1').to route_to('worktimes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/worktimes/1/edit').to route_to('worktimes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/worktimes').to route_to('worktimes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/worktimes/1').to route_to('worktimes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/worktimes/1').to route_to('worktimes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/worktimes/1').to route_to('worktimes#destroy', id: '1')
    end
  end
end
