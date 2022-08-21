require 'rails_helper'

RSpec.describe "VerseAnswers", type: :request do
  describe "GET /index" do
    it 'foo' do
      game_session = create(:game_session, :with_one_question)
      debugger

      as_logged_in_user(name: 'Philip') do

        post user_game_sessions_path, params: {game_session_id: game_session.id }
      end

      expect(game_session.users.find_by_name('Philip')).to be_present
    end
  end
end
