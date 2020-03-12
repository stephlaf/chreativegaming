class AddMembershipLevelToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :membership_level, :string
  end
end
