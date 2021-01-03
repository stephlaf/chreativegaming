class AddPriorityBlogpostToBlogPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_posts, :priority_post, :boolean, default: false
  end
end
