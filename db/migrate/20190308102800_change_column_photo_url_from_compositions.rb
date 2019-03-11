class ChangeColumnPhotoUrlFromCompositions < ActiveRecord::Migration[5.2]
  def change
    rename_column :compositions, :photo_url, :image_id
  end
end
