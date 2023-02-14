class CreateProuts < ActiveRecord::Migration[6.0]
  def change
    create_table :prouts do |t|

      t.timestamps
    end
  end
end
