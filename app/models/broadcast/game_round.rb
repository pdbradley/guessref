include ActionView::RecordIdentifier
module Broadcast
  class GameRound

    def self.update(game_round)
      new(game_round).update
    end

    def initialize(game_round)
      @game_round = game_round
    end

    def update
      Turbo::StreamsChannel.broadcast_replace_later_to(
        @game_round.game_session,
        target: dom_id(@game_round),
        html: game_round_component
      )
    end

    private

    attr_reader :game_round

    def game_round_component
      ApplicationController.render(
        GameRoundComponent.new(game_round: @game_round),
        layout: false
      )
    end
  end
end
