class AddStatusToVerses < ActiveRecord::Migration[6.1]
  def change
    add_column :verses, :status, :string, default: "QUEUED", index: true
  end
end
