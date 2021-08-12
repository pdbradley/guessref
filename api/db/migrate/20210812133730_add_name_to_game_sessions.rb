class AddNameToGameSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :game_sessions, :name, :string
  end
end
