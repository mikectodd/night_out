class AddAttendanceCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :attendances_count, :integer
  end
end
