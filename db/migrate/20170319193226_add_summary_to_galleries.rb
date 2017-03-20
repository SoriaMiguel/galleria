class AddSummaryToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :summary, :text
  end
end
