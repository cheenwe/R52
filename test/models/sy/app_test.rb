# == Schema Information
#
# Table name: sy_apps
#
#  id         :bigint           not null, primary key
#  abbr       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Sy::AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
