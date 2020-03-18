class AddDefaultToPriceInGames < ActiveRecord::Migration[6.0]
  def change
    change_column_default :games, :price_cents, from: nil, to: 0
  end
end
