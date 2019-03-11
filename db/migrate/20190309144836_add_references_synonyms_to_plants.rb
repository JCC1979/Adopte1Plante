class AddReferencesSynonymsToPlants < ActiveRecord::Migration[5.2]
  def change
    remove_reference :synonyms, :plant
    add_reference :plants, :synonym
  end
end
