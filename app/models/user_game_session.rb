class UserGameSession < ApplicationRecord


  after_create_commit -> {
    Broadcast::UserGameSession.add_to_game_session(self)
  }

  after_destroy_commit -> {
    Broadcast::UserGameSession.new(self).remove_from_game_session
  }

  belongs_to :user
  belongs_to :game_session

  validates_uniqueness_of :user_id, :scope => :game_session_id, :message => "Same user can't join the same game session twice!"
end
