require 'rails_helper'
require 'securerandom'

RSpec.describe "Games", type: :request do
  describe "POST /games" do
    it 'creates a new game session when given good params' do
      creator_uuid = SecureRandom.uuid

      post new_game_path, params: {creator_uuid: creator_uuid}

      expect(response).to have_http_status(:success)
      expect(json["creator_uuid"]).to eq creator_uuid
    end
  end

  describe "POST /start_game" do
    it 'finds a given game and starts it' do
      game_session = create(:game_session)
      uuid = game_session.reload.uuid

      post start_game_path, params: {uuid: uuid}

      expect(response).to have_http_status(:success)
      expect(game_session.reload.status).to eq GameSession::ACTIVE_STATUS
    end
  end

  def json
    JSON.parse(response.body)
  end
end
