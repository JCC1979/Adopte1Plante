class AddPhotoToCompositions < ActiveRecord::Migration[5.2]
  def change
    add_column :compositions, :photo, :string
  end
end
