class CreateBlogLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_likes do |t|
      t.references :blog_post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
