require 'rails_helper'

RSpec.describe "Entries", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/entries/create"
      expect(response).to have_http_status(:success)
    end
  end

end
