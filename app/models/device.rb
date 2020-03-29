# == Schema Information
#
# Table name: devices
#
#  id         :uuid             not null, primary key
#  family     :string           default("")
#  name       :string           default("")
#  os         :string           default("")
#  local_id   :string
#  active     :boolean          default("true")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Device < ApplicationRecord
  has_many :device_locations
  has_many :device_alerts

  validates :local_id, presence: true
end
