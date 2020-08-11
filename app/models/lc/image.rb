# == Schema Information
#
# Table name: lc_images
#
#  id          :integer          not null, primary key
#  file        :string
#  kind        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  carriage_id :integer
#  train_id    :integer
#
class Lc::Image < ApplicationRecord
    belongs_to :train, class_name: "Lc::Train"

    mount_uploader :file, TrainUploader
end
