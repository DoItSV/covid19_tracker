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
require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
