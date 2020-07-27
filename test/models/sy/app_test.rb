# == Schema Information
#
# Table name: sy_apps
#
#  id         :integer          not null, primary key
#  abbr       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Sy::AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
