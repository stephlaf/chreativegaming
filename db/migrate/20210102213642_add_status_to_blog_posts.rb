class AddStatusToBlogPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_posts, :status, :integer, default: 0
  end
end
