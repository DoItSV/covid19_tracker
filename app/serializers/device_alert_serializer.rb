class DeviceAlertSerializer
  include FastJsonapi::ObjectSerializer
  attributes :device_id, :alert
end
