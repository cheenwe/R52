# == Schema Information
#
# Table name: sy_alarms
#
#  id         :bigint           not null, primary key
#  alarm_at   :datetime
#  reason     :text(4294967295)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
require 'test_helper'

class Sy::AlarmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
