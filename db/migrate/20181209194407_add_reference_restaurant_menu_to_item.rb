class AddReferenceRestaurantMenuToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :restaurant_menu_id
  end
end
