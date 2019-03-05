class CreateSynonyms < ActiveRecord::Migration[5.2]
  def change
    create_table :synonyms do |t|
      t.references :product, foreign_key: true
      t.string :commercial_name
      t.text :synonyms_list

      t.timestamps
    end
  end
end
