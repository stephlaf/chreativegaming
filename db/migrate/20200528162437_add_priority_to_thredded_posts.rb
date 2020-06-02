class AddPriorityToThreddedPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :thredded_posts, :priority, :boolean
  end
end
