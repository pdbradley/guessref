class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.uuid :game_session_uuid, null: false, index: true
      t.uuid :user_uuid, null: false, index: true
    end
  end
end
