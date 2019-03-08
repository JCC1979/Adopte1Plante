class ChangeColumnSkuToVariants < ActiveRecord::Migration[5.2]
  def change
    change_column :variants, :sku, :string
  end
end
