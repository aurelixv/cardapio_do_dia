class CreateRestaurantMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_menus do |t|
      t.string :name

      t.timestamps
    end
  end
end
