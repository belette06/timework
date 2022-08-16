# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/affaires', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Affaire. As you add validations to Affaire, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Affaire.create! valid_attributes
      get affaires_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      affaire = Affaire.create! valid_attributes
      get affaire_url(affaire)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_affaire_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      affaire = Affaire.create! valid_attributes
      get edit_affaire_url(affaire)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Affaire' do
        expect do
          post affaires_url, params: { affaire: valid_attributes }
        end.to change(Affaire, :count).by(1)
      end

      it 'redirects to the created affaire' do
        post affaires_url, params: { affaire: valid_attributes }
        expect(response).to redirect_to(affaire_url(Affaire.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Affaire' do
        expect do
          post affaires_url, params: { affaire: invalid_attributes }
        end.to change(Affaire, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post affaires_url, params: { affaire: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested affaire' do
        affaire = Affaire.create! valid_attributes
        patch affaire_url(affaire), params: { affaire: new_attributes }
        affaire.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the affaire' do
        affaire = Affaire.create! valid_attributes
        patch affaire_url(affaire), params: { affaire: new_attributes }
        affaire.reload
        expect(response).to redirect_to(affaire_url(affaire))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        affaire = Affaire.create! valid_attributes
        patch affaire_url(affaire), params: { affaire: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested affaire' do
      affaire = Affaire.create! valid_attributes
      expect do
        delete affaire_url(affaire)
      end.to change(Affaire, :count).by(-1)
    end

    it 'redirects to the affaires list' do
      affaire = Affaire.create! valid_attributes
      delete affaire_url(affaire)
      expect(response).to redirect_to(affaires_url)
    end
  end
end
