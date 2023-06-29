class AddChargeCentsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :charge_cents, :integer
  end
end
