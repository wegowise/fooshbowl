class Game < ActiveRecord::Base
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"

  belongs_to :season

  default_scope { order(:created_at) }

  validates :season_id, presence: true

  before_validation :assign_season, if: -> { season_id.blank? }

  def goals_for(player)
    player1_id == player.id ? player1_score : player2_score
  end

  def goals_against(player)
    player1_id == player.id ? player2_score : player1_score
  end

  def win?(player)
    goals_for(player) > goals_against(player)
  end

  private

  def assign_season
    self.season = Season.current
  end
end
