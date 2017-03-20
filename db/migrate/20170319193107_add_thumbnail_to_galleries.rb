class AddThumbnailToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :thumbnail, :string
  end
end
