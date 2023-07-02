require 'rails_helper'

# there are so many holes in this, we are not checking for duplicate answers, 
# that the verse being answered is actually current in the game, etc.
# It just isn't worth the trouble.
# Someone could mess up some active games with this laxness.
# Let them.
#
# At a minimum we can at least disallow answers from people not in the game

# account for missing verse, missing book answer in this test
# just return nope
# account for duplicate guesses per verse id?  maybe db constraint

RSpec.describe "BookGuesses", type: :request do
  describe "POST /book_guesses" do
    describe "as user in the game session" do
      # for now, not storing guesses
      # it 'creates a user_guess record with appropriate values when given correct params' do
      #   game_session = create(:game_session, :with_one_question)
      #   game_round = game_session.game_rounds.first
      #   verse = game_session.verses.first
      #   book_answer = verse.book_answers.find_by(correct: true)

      #   as_logged_in_user do
      #     game_session.users << controller.current_user
      #     post book_guesses_path, params: {verse_id: verse.id, book_answer_id: book_answer.id }
      #   end

      #   user_answer = game_session.user_answers.first

      #   expect(user_answer.user).to eq controller.current_user
      #   expect(user_answer.verse).to eq verse
      #   expect(user_answer.game_round).to eq game_round
      #   expect(user_answer.game_session).to eq game_session
      #   expect(user_answer.book_answer).to eq book_answer
      #   expect(user_answer.answer_point_value).to eq book_answer.point_value

      #   expect(response).to have_http_status(:success)
      # end
      # it 'returns an error code when params are invalid' do
      #   game_session = create(:game_session, :with_one_question)
      #   game_round = game_session.game_rounds.first
      #   verse = game_session.verses.first
      #   book_answer = verse.book_answers.find_by(correct: true)

      #   as_logged_in_user do
      #     game_session.users << controller.current_user
      #     post book_guesses_path, params: {verse_id: verse.id, book_answer_id: -1 }
      #   end

      #   expect(response).to have_http_status(:bad_request)
      # end
    end
  end
end
