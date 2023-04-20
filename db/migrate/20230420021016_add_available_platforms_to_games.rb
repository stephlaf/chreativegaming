class AddAvailablePlatformsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :available_platforms, :string
  end
end
