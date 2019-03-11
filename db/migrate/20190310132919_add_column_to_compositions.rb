class AddColumnToCompositions < ActiveRecord::Migration[5.2]
  def change
    add_column :compositions, :local_image, :string
    add_column :compositions, :variant_pot, :integer
    add_column :compositions, :variant_plant, :integer
    remove_column :compositions, :variants_match
  end
end
