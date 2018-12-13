class AddAttendeeCountToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :attendees_count, :integer
  end
end
