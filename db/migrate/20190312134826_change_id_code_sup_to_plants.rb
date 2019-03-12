class ChangeIdCodeSupToPlants < ActiveRecord::Migration[5.2]
  def change
    change_column :plants, :id_code, :string
    change_column :plants, :id_sup, :string
  end
end
