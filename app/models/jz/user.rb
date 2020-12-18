# == Schema Information
#
# Table name: jz_users
#
#  id             :bigint           not null, primary key
#  alipay         :string(255)
#  code           :string(255)
#  id_card        :string(255)
#  name           :string(255)
#  phone          :string(255)
#  rate           :integer
#  remark         :string(255)
#  state          :integer
#  this_month_num :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Jz::User < ApplicationRecord
    SHIXI_NAME= ["马好亚", "黄璇琦", "刘俊飞", "刘伊文"] 

    scope :shixi, ->{ where(name:SHIXI_NAME) }

    has_many  :records, class_name: "Jz::Record", dependent: :destroy
    has_many  :sxes, class_name: "Jz::Sx", dependent: :destroy

    before_create :gen_code

    def gen_code
        code = Jz::User.last.code.succ rescue "001"
    end


    def up_code
        i=1
        Jz::User.all.each do |user|
            user.update(code: i)
            i +=1
        end
    end
end
