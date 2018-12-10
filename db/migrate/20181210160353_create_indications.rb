class CreateIndications < ActiveRecord::Migration[5.2]
  def change
    create_table :indications do |t|

      t.timestamps
    end
  end
end
