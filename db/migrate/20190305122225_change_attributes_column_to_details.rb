class ChangeAttributesColumnToDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :attributes, :details
  end
end
