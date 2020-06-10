class ChangeThreddedPostIdToPostIdInLikes < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :thredded_post_id, :post_id
  end
end
