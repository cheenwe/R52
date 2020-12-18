# == Schema Information
#
# Table name: column_upcases
#
#  id         :bigint           not null, primary key
#  contect    :text(65535)
#  result     :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ColumnUpcase < ApplicationRecord

    before_create :gen_result

    def gen_result
        cs = self.contect.split("\r\n")
        tmp_str = '<br>'
        cs.each do |item|
            p item
            if item != ""

                up_case = item.split(" ")[1].classify
                str = up_case +":  , //" + item + " <br>\r\n"
                tmp_str = tmp_str + str

            end
        end
        self.result = tmp_str
    end


end
