class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :id_code
      t.integer :id_sup
      t.string :family
      t.string :gender
      t.string :species
      t.string :cultivar
      t.string :variant
      t.text :description
      t.string :sun_exposure
      t.string :watering

      t.timestamps
    end
  end
end
