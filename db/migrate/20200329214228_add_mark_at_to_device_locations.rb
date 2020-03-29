class AddMarkAtToDeviceLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :device_locations, :mark_at, :datetime
  end
end
