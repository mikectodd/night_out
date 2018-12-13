class AddLocationLatitudeToBar < ActiveRecord::Migration[5.1]
  def change
    add_column :bars, :location_latitude, :float
  end
end
