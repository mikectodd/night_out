class AddLocationFormattedAddressToBar < ActiveRecord::Migration[5.1]
  def change
    add_column :bars, :location_formatted_address, :string
  end
end
