class AddColumnsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :telephone, :string
    add_column :restaurants, :email, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :food_type, :string
  end
end
