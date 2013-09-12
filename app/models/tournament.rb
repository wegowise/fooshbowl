class Tournament < ActiveRecord::Base
  has_many :games, class_name: 'TournamentGame'

  validates :name, presence: true

  def self.generate(name, n_rounds)
    self.transaction do
      tournament = Tournament.create(name: name)
      game = tournament.games.create!(round: n_rounds)
      generate_games(tournament, game, n_rounds - 1, n_rounds)
      tournament
    end
  end

  def self.generate_games(tournament, parent_game, round, n_rounds)
    return if round <= 0

    game1 = tournament.games.create!(round: round,
                                    parent_game: parent_game)

    game2 = tournament.games.create!(round: round,
                                    parent_game: parent_game)

    generate_games(tournament, game1, round-1, n_rounds)
    generate_games(tournament, game2, round-1, n_rounds)
  end

  def assign_players (players)
  end
end
