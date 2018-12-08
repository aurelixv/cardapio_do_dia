class AddManagerForeignKeyToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :manager, foreign_key: true
  end
end
