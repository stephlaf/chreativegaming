class CreateSeoTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :seo_templates do |t|

      t.timestamps
    end
  end
end
