class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image
      t.string :location
      t.text :food

      t.timestamps
    end
  end
end
