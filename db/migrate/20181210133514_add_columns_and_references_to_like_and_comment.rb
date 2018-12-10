class AddColumnsAndReferencesToLikeAndComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment, :text
    add_reference :comments, :item, foreign_key: :true
    add_reference :likes, :item, foreign_key: :true
  end
end
