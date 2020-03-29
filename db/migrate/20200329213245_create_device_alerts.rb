class CreateDeviceAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :device_alerts, id: :uuid do |t|
      t.uuid :device_id
      t.integer :alert, default: 0

      t.timestamps
    end
  end
end
