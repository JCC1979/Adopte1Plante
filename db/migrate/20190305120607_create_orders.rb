class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :profile, foreign_key: true
      t.references :composition, foreign_key: true
      t.string :status
      t.string :composition_nickname

      t.timestamps
    end
  end
end
