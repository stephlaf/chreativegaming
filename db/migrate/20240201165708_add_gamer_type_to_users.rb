class AddGamerTypeToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :gamer_type, :integer
  end

  def down
    remove_column :users, :gamer_type, :integer
  end
end
