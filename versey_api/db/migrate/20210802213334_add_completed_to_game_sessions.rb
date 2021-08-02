class AddCompletedToGameSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :game_sessions, :completed, :boolean, default: false, index: true
  end
end
