class AddColumnsToPlants < ActiveRecord::Migration[5.2]
    def change
      add_column :plants, :commercial_name, :string
      add_column :plants, :synonyms_list, :text
    end
end
