class CreateVariantPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :variant_plants do |t|
      t.integer :sku
      t.references :plant, foreign_key: true
      t.integer :diameter_cm
      t.string :height_format
      t.timestamps
    end
  end
end
