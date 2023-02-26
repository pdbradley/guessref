require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /any" do
    it "forces a login if no session exists then redirects to original dest" do
      game_session = create(:game_session)

      get game_session_path(game_session)
      expect(response).to redirect_to sign_in_path
      post session_path, params: {name: 'Foo'}
      expect(response).to redirect_to game_session_path(game_session)
    end
  end
end
