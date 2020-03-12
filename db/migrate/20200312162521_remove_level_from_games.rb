class RemoveLevelFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :level, :string
  end
end
