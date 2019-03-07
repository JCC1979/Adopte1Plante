class ChangeColumnVariantsMatchToCompositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :compositions, :variants_match
  end
end
