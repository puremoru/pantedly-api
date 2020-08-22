require 'rails_helper'

RSpec.describe "Scouts", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/scouts/create"
      expect(response).to have_http_status(:success)
    end
  end

end
