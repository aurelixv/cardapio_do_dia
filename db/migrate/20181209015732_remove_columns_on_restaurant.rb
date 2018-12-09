class RemoveColumnsOnRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :menu_id
    add_reference :items, :restaurant, foreign_key: :true
  end
end
