class AddCreatorUuidToGameSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :game_sessions, :creator_uuid, :uuid, index: true
  end
end
