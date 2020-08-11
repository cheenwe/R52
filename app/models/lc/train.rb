# == Schema Information
#
# Table name: lc_trains
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Lc::Train < ApplicationRecord
end
