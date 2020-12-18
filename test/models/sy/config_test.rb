# == Schema Information
#
# Table name: sy_configs
#
#  id         :bigint           not null, primary key
#  value      :string(255)
#  var        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Sy::ConfigTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
