class ChangeChargeCentsToChargeInOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :charge_cents, :charge
  end
end
