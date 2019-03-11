class ChangeColumnsVariantPotFromCompositions < ActiveRecord::Migration[5.2]
  def change
    rename_column :compositions, :variant_plant, :variant_plant_sku
    rename_column :compositions, :variant_pot, :variant_pot_sku
  end
end
