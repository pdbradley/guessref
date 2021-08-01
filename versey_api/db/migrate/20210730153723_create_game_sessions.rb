class CreateGameSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :game_sessions do |t|
      enable_extension "uuid-ossp";
      enable_extension "pgcrypto";
      t.integer :tick, default: 0
      t.uuid :uuid, default: 'uuid_generate_v1()', null: false, index: true

      t.timestamps
    end
  end
end
