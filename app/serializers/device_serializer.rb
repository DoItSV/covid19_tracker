class DeviceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :family, :name, :os, :local_id
end
