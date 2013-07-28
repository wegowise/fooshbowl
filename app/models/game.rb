class Game < ActiveRecord::Base
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"

  default_scope { order(:created_at) }

  def goals_for(player)
    player1_id == player.id ? player1_score : player2_score
  end

  def goals_against(player)
    player1_id == player.id ? player2_score : player1_score
  end

  def win?(player)
    goals_for(player) > goals_against(player)
  end
end
