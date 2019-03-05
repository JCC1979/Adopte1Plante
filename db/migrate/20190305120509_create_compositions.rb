class CreateCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :compositions do |t|
      t.string :variants_match
      t.text :photo_url

      t.timestamps
    end
  end
end
