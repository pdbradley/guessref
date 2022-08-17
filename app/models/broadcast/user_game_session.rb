include ActionView::RecordIdentifier
module Broadcast
  class UserGameSession

    def self.add_to_game_session(user_game_session)
      new(user_game_session).add_to_game_session
    end

    def initialize(user_game_session)
      @user_game_session = user_game_session
      @user = user_game_session.user
      @game_session = user_game_session.game_session
    end

    def add_to_game_session
      Turbo::StreamsChannel.broadcast_prepend_later_to(
        @game_session,
        target: "user-sessions",
        html: player_badge
      )
    end

    def remove_from_game_session
      Turbo::StreamsChannel.broadcast_remove_to(
        @game_session,
        target: @user,
      )
    end

    private

    def player_badge
      ApplicationController.render(
        PlayerBadgeComponent.new(user: @user),
        layout: false
      )
    end
  end
end


