class AddStatusToThreddedPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :thredded_posts, :status, :integer, default: 0
    add_index :thredded_posts, :status
  end
end
