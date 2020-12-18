class Sy::InfosController < ApplicationController
  before_action :set_sy_info, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token, only: [:heartbeat, :events, :configs]
  skip_before_action :base_authenticate, only: [:heartbeat, :events, :configs]
  # before_action :check_token, only: [:heartbeat]


  # POST events
  def events
    reason = {}
    service_id = params[:eventCode]
    alarm_at = params[:eventStartTime]
    reason[:eventPIC1] = params[:eventPIC1]
    reason[:eventPIC2] = params[:eventPIC2]
    reason[:eventPIC3] = params[:eventPIC3]
    reason[:eventAudioURL] = params[:eventAudioURL]
    reason[:videoIP] = params[:videoIP]
    reason[:eventCode] = params[:eventCode]
    Sy::Alarm.create!(reason: reason, alarm_at: alarm_at, service_id: service_id)

    render json:  {"code": 200, "message": "success"}
  end
 

  # POST config
  def configs
    stateType = params[:stateType] 
    content = params[:content] 
    if stateType == "1"
      Sy::Config.cfg("rtsp")
      Sy::Config.find_by(var: "rtsp").update(value: content)
    elsif stateType == "2"
      Sy::Config.cfg("ftp")
      Sy::Config.find_by(var: "ftp").update(value: content)
    end
    # # info = Sy::Info.create(reason: videoIP)
    render json:  {"code": 1, "message": "success"}
  end
  
  # POST heartbeat
  def heartbeat
    videoIP = params[:videoIP] 
    info = Sy::Info.create(reason: videoIP)
    render json:  {"code": Sy::Config.cfg("address").to_i, "message": "success"}
  end
  
  def monitor_api

  end

  def sy

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
