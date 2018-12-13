class CreateAttendences < ActiveRecord::Migration[5.1]
  def change
    create_table :attendences do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :bar_id

      t.timestamps
    end
  end
end
