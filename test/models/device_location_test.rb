# == Schema Information
#
# Table name: device_locations
#
#  id         :uuid             not null, primary key
#  device_id  :uuid
#  latitude   :string           default("")
#  longitude  :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class DeviceLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
