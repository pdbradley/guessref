class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.uuid :uuid, default: 'uuid_generate_v1()', null: false, index: true
    end
  end
end
