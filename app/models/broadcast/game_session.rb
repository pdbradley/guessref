include ActionView::RecordIdentifier
module Broadcast
  class GameSession

    def self.add_to_index(game_session)
      new(game_session).add_to_index
    end

    def self.update(game_session)
      new(game_session).update
    end

    def initialize(game_session)
      @game_session = game_session
    end

      # Turbo::StreamsChannel.broadcast_prepend_later_to(gs, target: "foo", html: '<b>hi>/b>')

    def add_to_index
      Turbo::StreamsChannel.broadcast_prepend_later_to(
        "guessref",
        target: "game_sessions",
        html: game_session_badge
      )
    end

    def update
      Turbo::StreamsChannel.broadcast_replace_later_to(
        @game_session,
        target: "game-session-show",
        html: game_session_component
      )
    end

    private

    attr_reader :game_session

    def game_session_component
      ApplicationController.render(
        GameSessionComponent.new(game_session: @game_session),
        layout: false
      )
    end

    def game_session_badge
      ApplicationController.render(
        GameSessionBadgeComponent.new(game_session: @game_session),
        layout: false
      )
    end
  end
end

