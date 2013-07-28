class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :player1, index: true
      t.belongs_to :player2, index: true
      t.integer :player1_score
      t.integer :player2_score

      t.timestamps
    end
  end
end
