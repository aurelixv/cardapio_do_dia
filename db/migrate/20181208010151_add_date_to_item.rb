class AddDateToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :dish_date, :date
  end
end
