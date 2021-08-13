class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.uuid :game_session_uuid, null: false, index: true
      t.uuid :user_uuid, null: false, index: true
      t.string :message, default: ''

      t.timestamps
    end
    change_column_default :chat_messages, :created_at, -> {'now()'}
    remove_column :chat_messages, :updated_at, :timestamp
  end
end
