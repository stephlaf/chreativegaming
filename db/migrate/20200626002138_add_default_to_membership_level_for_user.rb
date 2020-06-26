class AddDefaultToMembershipLevelForUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :membership_level, from: nil, to: ''
  end
end
