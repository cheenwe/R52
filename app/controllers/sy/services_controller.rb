class Sy::ServicesController < ApplicationController
  before_action :set_sy_service, only: [:show, :edit, :update, :destroy]

  # GET /sy/services
  def index
    # @sy_services = Sy::Service.all

    # @sy_services = Sy::Service.order("id desc")

    @q = Sy::Service.includes(:app).order("id desc").ransack(params[:q])
    @sy_services = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])

  end

  # GET /sy/services/1
  def show
  end

  # GET /sy/services/new
  def new
    @sy_service = Sy::Service.new
  end

  # GET /sy/services/1/edit
  def edit
  end

  # POST /sy/services
  def create
    @sy_service = Sy::Service.new(sy_service_params)

    if @sy_service.save
      redirect_to @sy_service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sy/services/1
  def update
    if @sy_service.update(sy_service_params)
      redirect_to @sy_service, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sy/services/1
  def destroy
    @sy_service.destroy
    redirect_to sy_services_url, notice: 'Service was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sy_service
      @sy_service = Sy::Service.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sy_service_params
      params.require(:sy_service).permit(:app_id, :name, :abbr, :remark, :is_open)
    end
end
