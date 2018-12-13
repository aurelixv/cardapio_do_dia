class RemoveRestaurantReferencesFromEmployeeAndManager < ActiveRecord::Migration[5.2]
  def change
    remove_reference :employees, :restaurant
    remove_reference :restaurants, :manager
    add_reference :users, :restaurant
  end
end
