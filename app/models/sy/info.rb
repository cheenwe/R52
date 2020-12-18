# == Schema Information
#
# Table name: sy_infos
#
#  id         :bigint           not null, primary key
#  reason     :string(255)
#  send_at    :datetime
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
class Sy::Info < ApplicationRecord
    belongs_to :service, class_name: "Sy::Service"

end
