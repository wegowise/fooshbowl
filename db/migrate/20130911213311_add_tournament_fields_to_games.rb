class AddTournamentFieldsToGames < ActiveRecord::Migration
  def change
    add_column :games, :type, :string, default: 'Game'
    add_column :games, :round, :integer
    add_column :games, :child_game_id, :integer
    add_column :games, :tournament_id, :integer
  end
end
