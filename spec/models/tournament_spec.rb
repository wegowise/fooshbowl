require "spec_helper"

describe Tournament do
  it "requires name" do
    Tournament.new.should have(1).error_on(:name)
  end

  describe ".generate" do
    before do
      create(:season)
    end

    it "should create 1 game with 1 round" do
      -> {
        Tournament.generate("My tourny", 1)
      }.should change(TournamentGame, :count).by(1)
    end

    it "should create 3 games with 2 rounds" do
      -> {
        Tournament.generate("My tourny", 2)
      }.should change(TournamentGame, :count).by(3)
    end

    it "should create 127 games with 7 rounds" do
      -> {
        Tournament.generate("My tourny", 7)
      }.should change(TournamentGame, :count).by(127)
    end
  end

  describe ".create_with_players" do
    before do
      create(:season)
    end

    it "should create 1 game when given 2 players" do
      players = Array.new(2) { create(:player) }
      -> {
        Tournament.create_with_players(players)
      }.should change(TournamentGame, :count).by(1)
    end

    it "should create 2 games in round 2 with 8 players" do
      players = Array.new(8) { create(:player) }
      Tournament.create_with_players(players)
      TournamentGame.where(round: 2).count.should == 2
    end

    it "should create games with proper round numbers with 13 players" do
      players = Array.new(13) { create(:player) }
      Tournament.create_with_players(players)
      TournamentGame.where(round: 4).count.should == 1
      TournamentGame.where(round: 3).count.should == 2
      TournamentGame.where(round: 2).count.should == 4
      TournamentGame.where(round: 1).count.should == 5
    end

    it "should create a game in round 1 with parent in round 2 given 3 players" do
      players = Array.new(3) { create(:player) }
      Tournament.create_with_players(players)
      TournamentGame.where(round: 1).count.should == 1
      TournamentGame.where(round: 1).first.parent_game.round.should == 2
    end
  end
end

