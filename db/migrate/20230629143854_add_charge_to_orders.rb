class AddChargeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :charge, :integer
  end
end
