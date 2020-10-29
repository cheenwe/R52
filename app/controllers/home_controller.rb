#encoding: UTF-8
class HomeController < ActionController::Base
  # before_filter :authenticate_mobile_user
  layout "mobile"


  def index
  end

  def ldap
  end

  def website
    if request.post?

      website_path = Sy::Config.cfg("website_path")
      system("cd #{website_path}&&./deploy")


      redirect_to "/website", notice:  "官网更新成功!" 
    end
  end

end
