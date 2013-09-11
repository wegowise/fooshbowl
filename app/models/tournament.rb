class Tournament < ActiveRecord::Base
  has_many :games, class_name: 'TournamentGame'

  validates :name, presence: true

  def self.generate(name, n_rounds)
    self.transaction do
      tournament = Tournament.create(name: name)
      game = tournament.games.create(round: 0)
      generate_games(tournament, game, 1, n_rounds)
      tournament
    end
  end

  def self.generate_games(tournament, child_game, round, n_rounds)
    return unless round < n_rounds

    game1 = tournament.games.create(round: round,
                                    child_game: child_game)

    game2 = tournament.games.create(round: round,
                                    child_game: child_game)

    generate_games(tournament, game1, round+1, n_rounds)
    generate_games(tournament, game1, round+1, n_rounds)
  end
end
