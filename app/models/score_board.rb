class ScoreBoard < ApplicationRecord
  belongs_to :game_session, optional: true

  # broadcasts_to ->(score_board) { score_board.game_session }, renderable: GameSessionScoreboardComponent.new(self)
  # broadcasts_to ->(score_board) { score_board.game_session }, html: rendered_score_board_component
  after_update_commit :replace_score_board

  def set_score(score_hash)
    self.scores ||= {}
    score_hashes = [score_hash].flatten #in case we get an array of hashes

    score_hashes.each do |score_hash|
      # { user_id: user_id, name: name, points: points }
      self.scores[score_hash[:user_id]] = score_hash
    end

    self.save
  end

  def add_to_score(user_id:, name:, points:)
    if self.scores[user_id.to_s]
      current_score = self.scores[user_id.to_s]['points']
      new_score = current_score + points.to_i

      self.scores[user_id] = { 
        user_id: user_id, 
        name: name, 
        points: new_score
      }
    else
      #create it
      self.scores[user_id] = { user_id: user_id, name: name, points: points }
    end
    self.save
  end

  def all_names_and_scores
    # [ { 'name' => 'High', 'points' => 30 }, { 'name' => 'Middle', 'points' => 20 }, { 'name' => 'Low', 'points' => 10 } ]
    names_and_scores = self.scores.map{|k,v| v.delete('user_id'); v}
    names_and_scores.sort_by { |x| x['points'] }.reverse
  end

  def replace_score_board
    broadcast_replace_to game_session, html: ApplicationController.render(GameSessionScoreboardComponent.new(self), layout: false)
  end
    
end
