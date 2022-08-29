require 'rails_helper'

RSpec.describe "User Game Sessions", type: :request do
  describe "DELETE /user_game_sessions" do
    it 'removes the user game session' do
      game_session = create(:game_session)

      as_logged_in_user(name: 'Philip') do
        # I don't like this but this is the easiest way to add the record we are going to delete
        post user_game_sessions_path, params: {game_session_id: game_session.id }

        delete user_game_session_path(game_session)
      end

      expect(game_session.users.find_by_name('Philip')).not_to be_present
    end
    it 'redirects to the game_session_index when successful' do
      game_session = create(:game_session)
      as_logged_in_user(name: 'Philip') do
        # I don't like this but this is the easiest way to add the record we are going to delete
        post user_game_sessions_path, params: {game_session_id: game_session.id }

        delete user_game_session_path(game_session)
      end

      expect(response).to redirect_to game_sessions_path
    end
  end

end
