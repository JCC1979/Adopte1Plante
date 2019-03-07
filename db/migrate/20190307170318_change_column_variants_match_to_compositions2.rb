class ChangeColumnVariantsMatchToCompositions2 < ActiveRecord::Migration[5.2]
  def change
    add_column :compositions, :variants_match, :jsonb
  end
end
