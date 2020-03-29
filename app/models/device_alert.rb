# == Schema Information
#
# Table name: device_alerts
#
#  id         :uuid             not null, primary key
#  device_id  :uuid
#  alert      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DeviceAlert < ApplicationRecord
  belongs_to :device

  enum kind: %i[symptoms covid19]
end
