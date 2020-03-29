class DeviceLocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :device_id, :latitude, :longitude, :mark_at
end
