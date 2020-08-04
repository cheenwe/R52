class Sy::InfosController < ApplicationController
  before_action :set_sy_info, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token, only: [:heartbeat]
  before_action :check_token, only: [:heartbeat]

  def monitor_api

  end

  def sy

  end

  # GET /api/v1/heartbeat
  def heartbeat
    app = params[:app]
    service = params[:service]
    state = params[:state]
    multi = params[:multi]
    reason = params[:reason]
    services = params["services"]

    if multi && multi == 1
        if app &&  services
          services.each do |item|
            service =  item["service"]
            state =  item["state"]
            reason =  item["reason"]
            service_id = Sy::Service.check_abbr(app, service)

            info = Sy::Info.create(service_id: service_id, state: state, reason: reason)
            ser = Sy::Service.find(service_id)

            reason = reason||""
            # 应用开启监控并且状态为异常
            if ser.is_open != false && info.state  == 1
              reason = "[实时监测]服务状态异常:#{reason}"
              Sy::Alarm.create(service_id: service_id, alarm_at: Time.now, reason: reason)
            end

            ser.update(state: state, remark: reason)
          end

          render json:  {
            "code": 200,
            "success": 1,
            "data": "1",
            "msg": "success"
          }
        else
          render json:  {
            "code": 400,
            "success": 0,
            "msg": "参数错误-services"
          }
        end

    else
      if app&&service&&state

        service_id = Sy::Service.check_abbr(app, service)
        info = Sy::Info.create(service_id: service_id, state: state, send_at:Time.now, reason: reason)
        # ser = Sy::Service.find(service_id).update(state: state)

        ser = Sy::Service.find(service_id)
        reason = reason||""
        # 应用开启监控并且状态为异常
        if ser.is_open != false && info.state  == 1

          reason = "[实时监测]服务状态异常:#{reason}"
          Sy::Alarm.create(service_id: service_id, alarm_at: Time.now, reason: reason)
        end

        ser.update(state: state, remark: reason)


        render json:  {
          "code": 200,
          "success": 1,
          "data": info.id,
          "msg": "success"
        }
      else
        render json:  {
          "code": 400,
          "success": 0,
          "msg": "参数错误-app"
        }
      end
    end
  end

  # GET /sy/infos
  def index
    # @sy_infos = Sy::Info.all
    @sy_infos = Sy::Info.includes(:service).order("id desc")

    @q = @sy_infos.ransack(params[:q])
    @sy_infos = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])

  end


  # GET /sy/infos/1
  def show
  end

  # GET /sy/infos/new
  def new
    @sy_info = Sy::Info.new
  end

  # GET /sy/infos/1/edit
  def edit
  end

  # POST /sy/infos
  def create
    @sy_info = Sy::Info.new(sy_info_params)

    if @sy_info.save
      redirect_to @sy_info, notice: 'Info was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sy/infos/1
  def update
    if @sy_info.update(sy_info_params)
      redirect_to @sy_info, notice: 'Info was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sy/infos/1
  def destroy
    @sy_info.destroy
    redirect_to sy_infos_url, notice: 'Info was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sy_info
      @sy_info = Sy::Info.find(params[:id])
    end

    def check_token
      if params[:token] && params[:token].size >= 8
      else
        render json:  {
          "code": 400,
          "success": 0,
          "msg": "参数错误, 请检测 token"
        }

      end

    end

    # Only allow a trusted parameter "white list" through.
    def sy_info_params
      params.require(:sy_info).permit(:service_id, :state, :send_at, :reason)
    end
end
