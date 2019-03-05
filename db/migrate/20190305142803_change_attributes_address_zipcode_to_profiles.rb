class ChangeAttributesAddressZipcodeToProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :address_zicpode, :address_zipcode
  end
end
