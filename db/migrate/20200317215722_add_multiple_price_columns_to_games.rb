class AddMultiplePriceColumnsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :price_bronze_cents, :integer, default: 0
    add_column :games, :price_silver_cents, :integer, default: 0
    add_column :games, :price_gold_cents, :integer, default: 0
    add_column :games, :price_platinum_cents, :integer, default: 0
  end
end
