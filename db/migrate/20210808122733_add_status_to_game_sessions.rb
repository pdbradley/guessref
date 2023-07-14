class AddStatusToGameSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :game_sessions, :status, :string, default: 'LOBBY', index: true
    remove_column :game_sessions, :completed, :boolean, default: false, index: true
  end
end
