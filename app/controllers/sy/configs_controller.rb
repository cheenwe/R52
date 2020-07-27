class Sy::ConfigsController < ApplicationController
  before_action :set_sy_config, only: [:show, :edit, :update, :destroy]
  before_action :base_authenticate

  # GET /sy/configs
  def index
    @sy_configs = Sy::Config.all
  end

  # GET /sy/configs/1
  def show
  end

  # GET /sy/configs/new
  def new
    @sy_config = Sy::Config.new
  end

  # GET /sy/configs/1/edit
  def edit
  end

  # POST /sy/configs
  def create
    @sy_config = Sy::Config.new(sy_config_params)

    if @sy_config.save
      redirect_to @sy_config, notice: 'Config was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sy/configs/1
  def update
    if @sy_config.update(sy_config_params)
      redirect_to @sy_config, notice: 'Config was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sy/configs/1
  def destroy
    @sy_config.destroy
    redirect_to sy_configs_url, notice: 'Config was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sy_config
      @sy_config = Sy::Config.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sy_config_params
      params.require(:sy_config).permit(:var, :value)
    end
end
