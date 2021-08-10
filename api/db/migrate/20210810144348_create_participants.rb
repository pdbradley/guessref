class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.uuid :game_session_uuid, null: false, index: true
      t.uuid :user_uuid, null: false, index: true
    end
    add_index :participants, [:game_session_uuid, :user_uuid], unique: true
  end
end
