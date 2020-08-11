# == Schema Information
#
# Table name: lc_carriages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  train_id   :integer
#
class Lc::Carriage < ApplicationRecord

    belongs_to :train, class_name: "Lc::Train"
end
