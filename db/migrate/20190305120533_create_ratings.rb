class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :composition, foreign_key: true
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
