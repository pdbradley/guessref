class CreateGameSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :game_sessions do |t|
      enable_extension "uuid-ossp";
      t.string :uuid, default: 'uuid_generate_v1()', null: false, index: true
      t.integer :tick, default: 0

      t.timestamps
    end
  end
end
