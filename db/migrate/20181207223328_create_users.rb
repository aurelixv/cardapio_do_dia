class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
