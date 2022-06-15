class UserGameSession < ApplicationRecord
  belongs_to :user
  belongs_to :game_session

  validates_uniqueness_of :user_id, :scope => :game_session_id, :message => "Same user can't join the same game session twice!"

end
