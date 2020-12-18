# == Schema Information
#
# Table name: bz_tools
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  project    :string(255)
#  purpose    :string(255)
#  remark     :string(255)
#  url        :string(255)
#  version    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Bz::ToolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
