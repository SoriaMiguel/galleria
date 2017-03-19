class AddXToY < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :user_id, :integer
    add_column :photos, :gallery_id, :integer
    add_foreign_key :galleries, :users, index: true
    add_foreign_key :photos, :galleries, index: true
  end

end
