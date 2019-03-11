class CreateVariantPots < ActiveRecord::Migration[5.2]
  def change
    create_table :variant_pots do |t|
      t.integer :sku
      t.references :pot, foreign_key: true
      t.integer :diameter_cm
      t.string :height_format
      t.timestamps
    end
  end
end
