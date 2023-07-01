class BuildsGameSessionStructureJob < ApplicationJob
  queue_as :default

  def perform(game_session_id)
    # hardcoding num rounds to 1 for now.  and num verses
    BuildsGameSessionStructure.new(game_session_id).build(num_rounds: 1, num_verses: 10)
  end
end

