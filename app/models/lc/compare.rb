# == Schema Information
#
# Table name: lc_compares
#
#  id          :integer          not null, primary key
#  new_file    :string
#  old_file    :string
#  reason      :string
#  result      :integer
#  result_file :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  carriage_id :integer
#  train_id    :integer
#
class Lc::Compare < ApplicationRecord

    belongs_to :train, class_name: "Lc::Train"
    belongs_to :carriage, class_name: "Lc::Carriage"
end
