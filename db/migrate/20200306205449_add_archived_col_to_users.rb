class AddArchivedColToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :archived, :boolean, default: false
  end
end
