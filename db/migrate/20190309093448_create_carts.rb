class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :state
      t.string :cart_sku
      t.monetize :amount, currency: { present: false }
      t.jsonb :payment
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
