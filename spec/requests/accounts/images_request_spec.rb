require 'rails_helper'

RSpec.describe "Accounts::Images", type: :request do

  describe "GET /edit" do
    it "returns http success" do
      get "/accounts/images/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
