class RenameImgColumnItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :img, :image_url
  end
end
