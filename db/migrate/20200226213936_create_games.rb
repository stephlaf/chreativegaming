class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :level
      t.integer :price_cents
      t.string :status

      t.timestamps
    end
  end
end
