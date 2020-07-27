# == Schema Information
#
# Table name: bz_versions
#
#  id         :integer          not null, primary key
#  file       :string
#  remark     :string
#  version    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tool_id    :integer
#
require 'test_helper'

class Bz::VersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
