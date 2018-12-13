class CreateBars < ActiveRecord::Migration[5.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :location
      t.string :drink_deal

      t.timestamps
    end
  end
end
