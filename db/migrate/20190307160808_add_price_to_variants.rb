class AddPriceToVariants < ActiveRecord::Migration[5.2]
  def change
    add_monetize :variants, :price, currency: { present: false }
  end
end
