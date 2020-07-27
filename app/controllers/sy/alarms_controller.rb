class Sy::AlarmsController < ApplicationController
  before_action :set_sy_alarm, only: [:show, :edit, :update, :destroy]

  # GET /sy/alarms
  def index
    # @sy_alarms = Sy::Alarm.all


    @sy_alarms = Sy::Alarm.includes(:service).order("id desc")

    @q = @sy_alarms.ransack(params[:q])
    @sy_alarms = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])

  end

  # GET /sy/alarms/1
  def show
  end

  # GET /sy/alarms/new
  def new
    @sy_alarm = Sy::Alarm.new
  end

  # GET /sy/alarms/1/edit
  def edit
  end

  # POST /sy/alarms
  def create
    @sy_alarm = Sy::Alarm.new(sy_alarm_params)

    if @sy_alarm.save
      redirect_to @sy_alarm, notice: 'Alarm was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sy/alarms/1
  def update
    if @sy_alarm.update(sy_alarm_params)
      redirect_to @sy_alarm, notice: 'Alarm was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sy/alarms/1
  def destroy
    @sy_alarm.destroy
    redirect_to sy_alarms_url, notice: 'Alarm was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sy_alarm
      @sy_alarm = Sy::Alarm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sy_alarm_params
      params.require(:sy_alarm).permit(:service_id, :alarm_at, :reason)
    end
end
