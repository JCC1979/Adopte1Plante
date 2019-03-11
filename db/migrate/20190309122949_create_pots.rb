class CreatePots < ActiveRecord::Migration[5.2]
  def change
    create_table :pots do |t|
      t.string :name
      t.string :material
      t.string :color

      t.timestamps
    end
  end
end
