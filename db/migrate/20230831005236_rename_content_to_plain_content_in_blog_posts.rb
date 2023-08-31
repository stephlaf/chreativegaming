class RenameContentToPlainContentInBlogPosts < ActiveRecord::Migration[6.0]
  def up
    rename_column :blog_posts, :content, :plain_content
  end

  def down
    rename_column :blog_posts, :plain_content, :content
  end
end
