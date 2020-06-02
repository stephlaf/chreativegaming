class ChangeColumnNamePriorityInThreddedPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :thredded_posts, :priority, :priority_post
  end
end
