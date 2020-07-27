class SendMailer < ApplicationMailer

  # 邮件测试
  # SendMailer.test('cxhyun@126.com',"mail test", "contentcontent").deliver
  def test(email, subject, info="空")
    return false if email.blank?
    @mail ={
      email: email,
      subject: subject,
      info: info
    }
    mail(to: email, subject: subject )
  end

  # SendMailer.alarm_mail(alarm).deliver
  def alarm_mail(alarm, info="空")
    # return false if email.blank?
    @alarm = alarm
    mail(to: Sy::Config.cfg("alarm_mails"), subject: Sy::Config.cfg("alarm_mail_subject") )
  end

  # 邮件测试
  # SendMailer.welcome_mail('cxhyun@126.com',"mail welcome_mail", "contentcontent").deliver
  def welcome_mail(user,  info="空")
    return false if user.email.blank?
    @user = user
    subject = "welcome_mail"
    mail(to: user.email, subject: subject )
  end

end
