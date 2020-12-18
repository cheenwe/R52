# == Schema Information
#
# Table name: jz_records
#
#  id           :bigint           not null, primary key
#  computer_num :integer
#  enter_at     :datetime
#  is_first     :boolean
#  remark       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class Jz::Record < ApplicationRecord
  belongs_to :user, class_name: "Jz::User"#, foreign_key: :user_id

  scope :today, -> { where("enter_at >?",Time.now.beginning_of_day ) }
  
  after_create :update_month_num
  def update_month_num
    num = self.user.this_month_num.nil?? 1 : self.user.this_month_num+1
    self.user.update(this_month_num: num)
       
  end
    
end
