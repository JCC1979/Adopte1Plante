class AddForeignkeyToVariants < ActiveRecord::Migration[5.2]
  def change
    add_reference :variants, :pot
    add_reference :variants, :plant
  end
end
