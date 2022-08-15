require 'rails_helper'
require 'securerandom'

RSpec.describe "Game Sessions", type: :request do
  describe "POST /games" do
    it 'creates a new game session when given good params' do
      creator_uuid = SecureRandom.uuid

      as_logged_in_user do
        post game_sessions_path, params: {creator_uuid: creator_uuid}
      end

      expect(response).to have_http_status(:success)
      expect(game_session
    end
  end

  describe "POST /start_game" do
    it 'finds a given game and starts it' do
      game_session = create(:game_session)

      as_logged_in_user do
        post start_game_session_path(game_session), params: {id: game_session.id}
      end

      expect(game_session.reload.status).to eq GameSession::ACTIVE_STATUS
    end
  end

end
