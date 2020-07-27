class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  default from:     proc { default_sender_address.format }
  default reply_to: proc { default_reply_to_address.format }

  default charset: "utf-8"
  default content_type: "text/html"

  default_url_options[:host] = "#{Sy::Config.cfg("app_url")}"


  # def self.default_url_options
  #   options = {:protocol => Sy::Config.cfg.protocol}
  #   if Sy::Config.cfg.host_name.to_s =~ /\A(https?\:\/\/)?(.+?)(\:(\d+))?(\/.+)?\z/i
  #     host, port, prefix = $2, $4, $5
  #     options.merge!({
  #       :host => host, :port => port, :script_name => prefix
  #     })
  #   else
  #     options[:host] = Sy::Config.cfg.host_name
  #   end
  #   options
  # end

  # Sy::Config.cfg("alarm_mails")
  private


  def default_sender_address
    address = Mail::Address.new(Sy::Config.cfg("user_name"))
    address.display_name = Sy::Config.cfg("email_sender_display_name")
    address
  end

  def default_reply_to_address
    address = Mail::Address.new(Sy::Config.cfg("mailer_reply_to"))
    address.display_name = Sy::Config.cfg("reply_to_display_name")
    address
  end
end
