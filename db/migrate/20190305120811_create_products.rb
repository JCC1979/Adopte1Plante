class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.jsonb :attributes

      t.timestamps
    end
  end
end
