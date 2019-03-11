class RemoveSynonymsFromPlants < ActiveRecord::Migration[5.2]
  def change
    remove_reference :plants, :synonym
  end
end
