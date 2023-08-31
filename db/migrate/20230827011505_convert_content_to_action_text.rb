class ConvertContentToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def up
    rename_column :blog_posts, :content, :old_content
    BlogPost.all.each do |post|
      post.update_attribute(:content, simple_format(post.old_content))
    end
  end

  def down
    add_column :blog_posts, :old_content, :text
    BlogPost.all.each do |post|
      post.update_attribute(:old_content, post.content.to_plain_text)
      post.content.delete
    end
    rename_column :blog_posts, :old_content, :content
  end
end
