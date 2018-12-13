class AddLocationLongitudeToBar < ActiveRecord::Migration[5.1]
  def change
    add_column :bars, :location_longitude, :float
  end
end
