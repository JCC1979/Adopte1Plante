class AddPricesToVariants < ActiveRecord::Migration[5.2]
  def change
    add_column :variant_plants, :price_cents, :integer, default: 0, null: false
    add_column :variant_pots, :price_cents, :integer, default: 0, null: false
  end
end
