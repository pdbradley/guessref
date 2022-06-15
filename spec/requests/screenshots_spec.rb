require 'rails_helper'

RSpec.describe "Screenshots", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/screenshots/index"
      expect(response).to have_http_status(:success)
    end
  end

end
