class AddDescriptionToRestaurantMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurant_menus, :description, :text
  end
end
