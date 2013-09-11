class TournamentGame < Game
  belongs_to :tournament

  belongs_to :child_game, class_name: 'TournamentGame'

  validates :round, presence: true
  validates :tournament_id, presence: true
end

