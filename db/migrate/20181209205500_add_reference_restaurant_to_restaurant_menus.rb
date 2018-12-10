class AddReferenceRestaurantToRestaurantMenus < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurant_menus, :restaurant, foreign_key: :true
  end
end
