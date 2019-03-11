class AddColumnCommercialNameToTaxrefs < ActiveRecord::Migration[5.2]
  def change
    add_column :taxrefs, :commercial_name, :string
  end
end
