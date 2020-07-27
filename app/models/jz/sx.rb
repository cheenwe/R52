# == Schema Information
#
# Table name: jz_sxes
#
#  id         :integer          not null, primary key
#  end_at     :datetime
#  name       :string
#  start_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Jz::Sx < ApplicationRecord
    belongs_to :user, class_name: "Jz::User"
    scope :today, -> { where("created_at >?",Time.now.beginning_of_day ) }
end
