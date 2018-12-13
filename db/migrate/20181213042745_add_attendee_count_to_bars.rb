class AddAttendeeCountToBars < ActiveRecord::Migration[5.1]
  def change
    add_column :bars, :attendees_count, :integer
  end
end
