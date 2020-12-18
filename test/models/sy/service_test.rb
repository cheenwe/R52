# == Schema Information
#
# Table name: sy_services
#
#  id         :bigint           not null, primary key
#  abbr       :string(255)
#  alarm_at   :datetime
#  alarm_mail :string(255)
#  alarm_num  :integer
#  is_open    :boolean          default(TRUE)
#  name       :string(255)
#  remark     :string(255)
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  app_id     :integer
#
require 'test_helper'

class Sy::ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
