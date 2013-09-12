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

  # Create the Tournament with the correct number of games for the given
  # players.
  def self.create_with_players (players)
    self.transaction do
      tournament = Tournament.create(name: name)
      n_rounds = Math.log2(players.count).ceil
      games = []

      (players.count - 2).downto(0) do |game_no|
        round = n_rounds - Math.log2(players.count - game_no).ceil + 1
        parent_game = games[games.count / 2]
        games << tournament.games.create!(round: round, parent_game: parent_game)
      end
      tournament
    end
  end
end
