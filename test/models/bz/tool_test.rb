# == Schema Information
#
# Table name: bz_tools
#
#  id         :integer          not null, primary key
#  name       :string
#  project    :string
#  purpose    :string
#  remark     :string
#  url        :string
#  version    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Bz::ToolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
