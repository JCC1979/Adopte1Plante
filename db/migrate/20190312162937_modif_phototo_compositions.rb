class ModifPhototoCompositions < ActiveRecord::Migration[5.2]
  def change
    rename_column :compositions, :image_id, :image_url
    change_column :compositions, :image_url, :text, default: "https://res.cloudinary.com/pileas-frog/image/upload/v1552403903/Adopte1plante/default.png"
  end
end
