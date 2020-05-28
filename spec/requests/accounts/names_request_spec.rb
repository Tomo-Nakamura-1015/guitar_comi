require 'rails_helper'

RSpec.describe "Accounts::Names", type: :request do

  describe "GET /edit" do
    it "returns http success" do
      get "/accounts/names/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/accounts/names/update"
      expect(response).to have_http_status(:success)
    end
  end

end
