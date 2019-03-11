class ChangeColumnsVariantPotFromCompositions2 < ActiveRecord::Migration[5.2]
  def change
    change_column :compositions, :variant_plant_sku, :string
    change_column :compositions, :variant_pot_sku, :string
  end
end
