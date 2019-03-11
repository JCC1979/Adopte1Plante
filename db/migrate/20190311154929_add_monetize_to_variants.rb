class AddMonetizeToVariants < ActiveRecord::Migration[5.2]
  def change
    remove_column :variant_plants, :price_cents
    remove_column :variant_pots, :price_cents
    add_monetize :variant_plants, :price, currency: { present: false }
    add_monetize :variant_pots, :price, currency: { present: false }
  end
end
