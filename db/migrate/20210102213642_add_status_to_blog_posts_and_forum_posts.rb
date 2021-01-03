class AddStatusToBlogPostsAndForumPosts < ActiveRecord::Migration[6.0]
  # def change
  #   create_enum :status, ['regular', 'priority', 'published']

  #   change_table :blog_posts do |t|
  #     t.enum :blog_post_status, enum_name: :status, null: false, default: "regular"
  #   end

  #   change_table :thredded_posts do |t|
  #     t.enum :forum_post_status, enum_name: :status, null: false, default: "regular"
  #   end

  #   add_index :blog_posts, :blog_post_status
  #   add_index :thredded_posts, :forum_post_status
  # end

  def up
    create_enum :status, ['regular', 'priority', 'published']

    change_table :blog_posts do |t|
      t.enum :blog_post_status, enum_name: :status, null: false, default: "regular"
    end

    change_table :thredded_posts do |t|
      t.enum :forum_post_status, enum_name: :status, null: false, default: "regular"
    end

    add_index :blog_posts, :blog_post_status
    add_index :thredded_posts, :forum_post_status
  end

  def down
    # drop_enum :status
    # remove_column :blog_posts, :blog_post_status
    # remove_column :thredded_posts, :forum_post_status
    # remove_index :blog_posts, :blog_post_status
    # remove_index :thredded_posts, :forum_post_status

    remove_column :blog_posts, :status
    remove_column :thredded_posts, :status
    remove_index :blog_posts, :index_blog_posts_on_status
    remove_index :thredded_posts, :index_thredded_posts_on_status
  end
end
