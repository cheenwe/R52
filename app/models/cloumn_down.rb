# == Schema Information
#
# Table name: cloumn_downs
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  result     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CloumnDown < ApplicationRecord

    before_create :gen_result

    def gen_result
        self.result = self.name.tableize.singularize
    end
end
