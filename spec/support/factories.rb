Forge.define :player, Player do |f|
  f.name = "Player #{Forge.sequence.next}"
end

Forge.define :game, Game do |f|
  f.player1 = Forge.create(:player)
  f.player2 = Forge.create(:player)
  f.player1_score = 10
  f.player2_score = 5
end
