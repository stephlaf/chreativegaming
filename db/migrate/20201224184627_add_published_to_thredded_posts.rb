class AddPublishedToThreddedPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :thredded_posts, :published, :boolean, default: false
  end
end
