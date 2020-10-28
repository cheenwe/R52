
Rails.application.config.action_mailer.delivery_method = :smtp

ActionMailer::Base.delivery_method = :smtp

#Rails.application.config.action_mailer.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
    address: Sy::Config.cfg("address"),
    port: Sy::Config.cfg("port"),
    user_name: Sy::Config.cfg("user_name"),
    password: Sy::Config.cfg("password"),
    domain: Sy::Config.cfg("domain"),
    authentication: :login,
    # enable_starttls_auto: Sy::Config.cfg("enable_ssl"),
    ssl: true
    # :openssl_verify_mode => 'none'

}


$ladp = Net::LDAP.new :host => Sy::Config.cfg("ldap_host"),
    :port =>  Sy::Config.cfg("ldap_port"),
    :auth => {
    :method => :simple,
    :username => Sy::Config.cfg("ldap_username"),
    :password => Sy::Config.cfg("ldap_password")
  }

