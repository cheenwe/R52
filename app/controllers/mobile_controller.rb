#encoding: UTF-8
class MobileController < ActionController::Base
  # before_filter :authenticate_mobile_user
  layout "mobile"

  before_action :authenticate_mobile_user
  skip_before_action :authenticate_mobile_user, :only => [ :login]

  def default
    render json: nil
  end


  def login
    if request.post?
      @login_user = User.find_by(username: params[:user][:name])
      if @login_user
        if @login_user.valid_password?(params[:user][:password])
          current_user = @current_user = @login_user
          session[:current_user_id] = @current_user.id
          session[:current_user_name] = @current_user.username

          respond_to do |format|
            # format.html { redirect_to redirect_back_or_default(root_url) }
            format.html { redirect_to "/m/home",  notice: '登陆成功.'  }
            format.json { render status: '201', json: resource.as_json(only: [:login, :email]) }
          end
        else
          respond_to do |format|
            # format.html { redirect_to redirect_back_or_default(root_url) }
            format.html { redirect_to "/m/login", alert: '请输入正确的用户名密码.'  }
            format.json { render status: '200', json: resource.as_json(only: [:login, :email]) }
          end
        end
      else

        respond_to do |format|
          # format.html { redirect_to redirect_back_or_default(root_url) }
          format.html { redirect_to "/m/login", alert: '请输入正确的用户名密码.'  }

          format.json { render status: '200', json: resource.as_json(only: [:login, :email]) }
        end
      end
    end
  end


  def logout
    session[:current_user_id] = nil
    session[:current_user_name] = nil

    respond_to do |format|
      format.html { redirect_to "/m/home", alert: ' 退出系统成功.'  }
      format.json { render status: '200', json: resource.as_json(only: [:login, :email]) }
    end
  end


  def home
  end

  def clients
      api_v1_clients = Client.where(saler_id: session[:current_user_id])
      @q = api_v1_clients.search(params[:q])
      @clients = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])
  end

  def clients_show
    @clients = Client.find(params[:id])
    @contacters = Api::V1::Contacter.find_by(client_id:params[:id])
  end

  #新建客户
  def client
    if request.post?
      p "-----"
      p params["client"]
      p params["contacter"]
      p "====="

      #客户单位
      client = params["client"]

      name = client["name"]
      nature_id = client["nature_id"]
      explanation = client["explanation"]
      province = client["province"]
      city = client["city"]
      product_id = client["product_id"]
      developer_id = client["developer_id"]
      suggest = client["suggest"]
      background = client["background"]
      puzzled = client["puzzled"]
      saler_name = client["saler_name"]

      # Client.create(
      #   name: name,
      #   nature_id: nature_id,
      #   explanation: explanation,
      #   province: province,
      #   city: city,
      #   product_id: product_id,
      #   developer_id: developer_id,
      #   suggest: suggest,
      #   background: background,
      #   puzzled: puzzled,
      #   saler_name: saler_name,
      # )

      #联系人
      contacter = params["contacter"]

      name = contacter["name"]
      phone = contacter["phone"]
      remark = contacter["remark"]
      nickname = contacter["nickname"]
      email = contacter["email"]

      p "姓名name: #{name}"
      p "手机phone: #{phone}"
      p "职位remark: #{remark}"
      p "住址nickname: #{nickname}"
      p "邮箱email: #{email}"
      
      # contacter_info = {
      # }
    end
  end

  def tracks
      api_v1_clients = Track.where(user_id: session[:current_user_id])
      @q = api_v1_clients.search(params[:q])
      @tracks = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])
  end

  def track
    if request.post?

      #联系人
      contacter = params["track"]

      name="track[category_id]"
      name="track[status_id]"
      name="track[visit_at]"
      name="track[comment]"
      name="track[place]"
    end
  end

  # api/写跟进/下拉选择
  def track_api

    #联系途径
    if params[:type] == "tujing"
      tujing=[]
      Api::V1::ClientTrack::Category.all.each do |item|
        tujing << {"title": item.name, "value": item.id}
      end
      render json: {data: tujing}

    #销售状态
    elsif params[:type] == "zhuangtai"
      zhuangtai=[]
        Api::V1::Client::Status.all.each do |item|
        zhuangtai << {"title": item.name, "value": item.id}
      end
      render json: {data: zhuangtai}

    #客户leixing
    elsif params[:type] == "leixing"
      leixing=[]
        Api::V1::Client::Nature.all.each do |item|
        leixing << {"title": item.name, "value": item.id}
      end
      render json: {data: leixing}

    #省份
    elsif params[:type] == "shengfen"
      shengfen=[]
        Std::Province.all.each do |item|
        shengfen << {"title": item.name, "value": item.id}
      end
      render json: {data: shengfen}

    #市
    elsif params[:type] == "chengshi"
      chengshi=[]
        Std::City.all.each do |item|
        chengshi << {"title": item.name, "value": item.id}
      end
      render json: {data: chengshi}

    #市
    elsif params[:type] == "xuqiu"
      xuqiu=[]
        Api::V1::Product.all.each do |item|
        xuqiu << {"title": item.name, "value": item.id}
      end
      render json: {data: xuqiu}
      
    end
  end


  # def template
  #   render :template => 'mobile/' + params[:path], :layout => nil
  # end

  def authenticate_mobile_user
    if session[:current_user_id].present?
      true
    else
        redirect_to '/m/login', alert: "请先登录账户"
      false
    end
  end

end
