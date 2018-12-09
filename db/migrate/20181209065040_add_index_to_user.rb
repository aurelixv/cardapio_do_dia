class AddIndexToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:email, :encrypted_password]
  end
end
