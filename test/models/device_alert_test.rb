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
require 'test_helper'

class DeviceAlertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
