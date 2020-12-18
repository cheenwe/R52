# == Schema Information
#
# Table name: bz_versions
#
#  id         :bigint           not null, primary key
#  file       :string(255)
#  remark     :text(65535)
#  version    :string(255)
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
