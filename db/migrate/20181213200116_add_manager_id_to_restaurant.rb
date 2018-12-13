class AddManagerIdToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :manager_id, :integer
  end
end
