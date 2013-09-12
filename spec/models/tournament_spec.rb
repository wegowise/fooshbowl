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

  describe "#assign_players" do
    it "should do stuff" do

    end
  end
end

