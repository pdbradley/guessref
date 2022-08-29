require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  # describe "logged out" do
  #   it "redirects to new session path when joining a game but not logged in" do
  #     game_session = create(:game_session)
  #     get game_sessions_path
  #
  #     expect(response).to redirect_to sign_in_path
  #   end
  # end


end
