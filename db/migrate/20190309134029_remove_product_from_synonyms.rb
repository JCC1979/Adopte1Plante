class RemoveProductFromSynonyms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :synonyms, :product
  end
end
