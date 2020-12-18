# == Schema Information
#
# Table name: sy_infos
#
#  id         :bigint           not null, primary key
#  reason     :string(255)
#  send_at    :datetime
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
require 'test_helper'

class Sy::InfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
