class BuildsGameSessionStructureJob < ApplicationJob
  queue_as :default

  def perform(game_session_id)
    BuildsGameSessionStructure.new(game_session_id).build(num_rounds: 1, num_verses: 3)
  end
end

