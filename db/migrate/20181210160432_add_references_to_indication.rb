class AddReferencesToIndication < ActiveRecord::Migration[5.2]
  def change
    add_reference :indications, :user, foreign_key: :true
    add_reference :indications, :item, foreign_key: :true
    add_column :indications, :destination_user, :integer
  end
end
