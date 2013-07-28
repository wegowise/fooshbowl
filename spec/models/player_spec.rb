require "spec_helper"

describe Player do
  let!(:player) { create(:player) }

  it "has goals" do
    10.times { create(:game, player1: player) }
    player.goals.should == 100
  end

  it "has goals against" do
    10.times { create(:game, player1: player) }
    player.goals_against.should == 50
  end

  it "has a goal differential" do
    create(:game, player1: player)
    create(:game, player2: player)
    create(:game, player2: player)
    player.goal_diff.should == -5
  end

  it "has a winning percentage" do
    create(:game, player1: player)
    create(:game, player2: player)
    player.winning_percentage.should == 50
  end
end
