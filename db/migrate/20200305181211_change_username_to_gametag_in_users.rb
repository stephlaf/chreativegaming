class ChangeUsernameToGametagInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :username, :gametag
    change_column_null :users, :gametag, false
  end
end
