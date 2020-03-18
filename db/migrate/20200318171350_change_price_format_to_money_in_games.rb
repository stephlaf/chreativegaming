class ChangePriceFormatToMoneyInGames < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :games, :price_cents, :money
    end

    def down
      change_column :games, :price_cents, :integer
    end
  end
end
