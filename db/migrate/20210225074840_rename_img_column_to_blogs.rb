class RenameImgColumnToBlogs < ActiveRecord::Migration[5.2]
  def change
    rename_column :blogs, :img, :image
  end
end
