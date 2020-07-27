class ApplicationController < ActionController::Base

  def base_authenticate
    p basic_auth_open = Sy::Config.cfg("basic_auth_open").nil??   0:Sy::Config.cfg("basic_auth_open")

    if basic_auth_open == "1"
      authenticate_or_request_with_http_basic do |username, password|
        p  basic_auth_username = Sy::Config.cfg("basic_auth_username").nil??   'admin':Sy::Config.cfg("basic_auth_username")
        p  basic_auth_password = Sy::Config.cfg("basic_auth_password").nil??   'admin':Sy::Config.cfg("basic_auth_password")
        p username
        p password

          if  basic_auth_username == username && basic_auth_password == password
            session[:id] = 1
            p "login success"
          else
            render plain: "Unauthorized access"
          end
      end

    end
  end

end
