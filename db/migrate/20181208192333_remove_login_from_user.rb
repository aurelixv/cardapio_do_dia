class RemoveLoginFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :login
  end
end
