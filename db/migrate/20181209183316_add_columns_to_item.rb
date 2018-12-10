class AddColumnsToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :food_type, :string
    add_column :items, :price, :float
  end
end
