class AddReferencesToSynonyms < ActiveRecord::Migration[5.2]
  def change
    add_reference :synonyms, :pot
    add_reference :synonyms, :plant
  end
end
