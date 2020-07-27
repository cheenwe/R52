# == Schema Information
#
# Table name: sy_services
#
#  id         :integer          not null, primary key
#  abbr       :string
#  is_open    :boolean          default(TRUE)
#  name       :string
#  remark     :string
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
