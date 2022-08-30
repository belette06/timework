require 'rails_helper'

RSpec.describe "Profils", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/profil/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/profil/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/profil/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
