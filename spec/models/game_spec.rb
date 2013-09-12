require "spec_helper"

describe Game do
  it { should belong_to(:season) }

  it "requires season" do
    Game.new.should have(1).error_on(:season_id)
  end

  it "A new game will default to being in latest season" do
    season1 = create(:season)
    season2 = create(:season)
    game = Game.create!
    game.season_id.should == season2.id
  end
end
