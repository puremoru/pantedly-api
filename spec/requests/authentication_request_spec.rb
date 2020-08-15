require 'rails_helper'

RSpec.describe "Authentications", type: :request do

  describe "GET /signup" do
    it "returns http success" do
      get "/authentication/signup"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    it "returns http success" do
      get "/authentication/login"
      expect(response).to have_http_status(:success)
    end
  end

end
