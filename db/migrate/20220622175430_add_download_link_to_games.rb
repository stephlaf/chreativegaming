class AddDownloadLinkToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :download_link, :string
  end
end
