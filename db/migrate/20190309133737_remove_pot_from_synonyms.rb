class RemovePotFromSynonyms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :synonyms, :pot
  end
end
