class MigrateDataFromBlogPostToActionText < ActiveRecord::Migration[6.0]
  def up
    BlogPost.all.each do |post|
      post.update!(content: post.plain_content)
    end
  end

  def down
    BlogPost.all.each do |post|
      post.update!(plain_content: post.content.to_plain_text)
    end
  end
end
