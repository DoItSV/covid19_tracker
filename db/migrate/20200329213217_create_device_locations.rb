class CreateDeviceLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :device_locations, id: :uuid do |t|
      t.uuid :device_id
      t.string :latitude, default: ''
      t.string :longitude, default: ''

      t.timestamps
    end
  end
end
