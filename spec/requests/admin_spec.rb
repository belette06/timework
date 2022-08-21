require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      get "/admin/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /weektimes" do
    it "returns http success" do
      get "/admin/weektimes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /Affaires" do
    it "returns http success" do
      get "/admin/Affaires"
      expect(response).to have_http_status(:success)
    end
  end

end
