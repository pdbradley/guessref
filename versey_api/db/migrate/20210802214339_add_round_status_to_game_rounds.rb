class AddRoundStatusToGameRounds < ActiveRecord::Migration[6.1]
  def change
    add_column :game_rounds, :status, :string, index: true, default: 'QUEUED'
  end
end
