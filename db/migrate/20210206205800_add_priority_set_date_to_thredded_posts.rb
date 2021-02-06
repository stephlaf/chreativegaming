class AddPrioritySetDateToThreddedPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :thredded_posts, :set_priority_date, :datetime
  end
end
