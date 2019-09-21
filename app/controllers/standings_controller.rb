class StandingsController < ApplicationController

  # GET /players
  # GET /players.json
  def index
    @games   = Game.all
    @players = Player.all.sort_by(&:winning_percentage).reverse
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

end
