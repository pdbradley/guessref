include ActionView::RecordIdentifier
module Broadcast
  class GameSession

    def self.add_to_index(game_session)
      new(game_session).add_to_index
    end

    def initialize(game_session)
      @game_session = game_session
    end

    def add_to_index
      Turbo::StreamsChannel.broadcast_prepend_later_to(
        "guessref",
        target: "game_sessions",
        html: game_session_badge
      )
    end

    private

    attr_reader :game_session

    def game_session_badge
      ApplicationController.render(
        GameSessionBadgeComponent.new(game_session: @game_session),
        layout: false
      )
    end
  end
end

