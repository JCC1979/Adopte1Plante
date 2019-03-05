class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.integer :sku
      t.references :product, foreign_key: true
      t.integer :diameter_cm
      t.string :height_format

      t.timestamps
    end
  end
end
