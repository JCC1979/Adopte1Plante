class ChangeColumnsSkuFromVariants < ActiveRecord::Migration[5.2]
  def change
    change_column :variant_plants, :sku, :string
    change_column :variant_pots, :sku, :string
  end
end
