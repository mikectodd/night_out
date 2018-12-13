class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :reviewer_id
      t.integer :restaurant_id
      t.integer :bar_id

      t.timestamps
    end
  end
end
