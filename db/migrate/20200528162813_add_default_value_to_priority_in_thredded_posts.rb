class AddDefaultValueToPriorityInThreddedPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :thredded_posts, :priority, false
  end
end
