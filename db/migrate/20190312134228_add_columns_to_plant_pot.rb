class AddColumnsToPlantPot < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :easy_seed_matching, :string
    add_column :pots, :easy_seed_matching, :string
  end
end
