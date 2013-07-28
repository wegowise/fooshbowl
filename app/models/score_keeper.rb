class ScoreKeeper
  attr_accessor :player

  def initialize(player)
    @player = player
  end

  def goals
    player.games.map { |game| game.goals_for(player) }.sum
  end
end
