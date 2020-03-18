class ChangeAllPriceFormatsToMoneyInGames < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :games, :price_bronze_cents, :money
      change_column :games, :price_silver_cents, :money
      change_column :games, :price_gold_cents, :money
      change_column :games, :price_platinum_cents, :money
    end

    def down
      change_column :games, :price_bronze_cents, :integer
      change_column :games, :price_silver_cents, :integer
      change_column :games, :price_gold_cents, :integer
      change_column :games, :price_platinum_cents, :integer
    end
  end
end
