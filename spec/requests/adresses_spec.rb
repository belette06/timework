require 'rails_helper'

RSpec.describe "Adresses", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/adresses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/adresses/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/adresses/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/adresses/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/adresses/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
