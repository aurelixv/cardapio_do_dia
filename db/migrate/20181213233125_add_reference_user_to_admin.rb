class AddReferenceUserToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_reference :admins, :user
  end
end
