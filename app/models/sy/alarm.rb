# == Schema Information
#
# Table name: sy_alarms
#
#  id         :bigint           not null, primary key
#  alarm_at   :datetime
#  reason     :text(4294967295)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
class Sy::Alarm < ApplicationRecord
    # belongs_to :service, class_name: "Sy::Service"

    # after_create :send_alarm_mail

    serialize :reason

    # alarm_at
    # alarm_mail
    # alarm_num
    # # Sy::Alarm.last.send_alarm_mail
    # def send_alarm_mail
    #   if Sy::Config.cfg("is_send_alarm_mail").to_i == 1 && service.is_open == true && service.alarm_num.present? && (service.alarm_num == 1||service.alarm_num == 2||service.alarm_num == 3||(service.alarm_num % 3)==0)
    #     # SendMailer.alarm_mail(self).deliver_later
    #     SendMailer.alarm_mail(service.alarm_mail, self).deliver_later
    #   end
    # end

end
