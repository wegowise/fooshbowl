class ChangeChildFlagToParentFlag < ActiveRecord::Migration
  def change
    rename_column :games, :child_game_id, :parent_game_id
  end
end
