class AddIndexToBlogPosts < ActiveRecord::Migration[6.0]
  def change
    add_index :blog_posts, :status
  end
end
