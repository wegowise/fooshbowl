class Player < ActiveRecord::Base
  def games
    Game.where(Game.arel_table[:player1_id].eq(id).or(Game.arel_table[:player2_id].eq(id)))
  end

  def games_played
      wins + losses
  end

  def wins
    games.select { |game| game.win?(self) }.size
  end

  def losses
    games.count - wins
  end

  def goals
    games.map { |game| game.goals_for(self) }.sum
  end

  def goals_against
    games.map { |game| game.goals_against(self) }.sum
  end

  def goal_diff
    goals - goals_against
  end

  def win_diff
    wins - losses
  end

  def winning_percentage
    return 0.0 if games.empty?
    (wins / games.size.to_f * 100).round(2)
  end
end
