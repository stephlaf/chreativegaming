class AddColumnAvailableToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :available, :boolean, default: false
  end
end
