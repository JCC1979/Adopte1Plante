class RemoveTablesProductsVariantsCategSynonyms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :category
    remove_reference :variants, :plant
    remove_reference :variants, :pot
    remove_reference :variants, :product
    drop_table :products
    drop_table :variants
    drop_table :categories
    drop_table :synonyms
  end
end
