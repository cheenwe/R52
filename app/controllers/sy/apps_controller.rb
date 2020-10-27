class Sy::AppsController < ApplicationController
  before_action :set_sy_app, only: [:show, :edit, :update, :destroy]

  # GET /sy/apps
  def index
    # @sy_apps = Sy::App.all

    @sy_apps = Sy::App.order("id desc")

    @q = @sy_apps.ransack(params[:q])
    @sy_apps = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])

  end

  # GET /sy/apps/1
  def show
  end

  def home
  end

  # GET /sy/apps/new
  def new
    @sy_app = Sy::App.new
  end

  # GET /sy/apps/1/edit
  def edit
  end

  # POST /sy/apps
  def create
    @sy_app = Sy::App.new(sy_app_params)

    if @sy_app.save
      redirect_to @sy_app, notice: 'App was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sy/apps/1
  def update
    if @sy_app.update(sy_app_params)
      redirect_to @sy_app, notice: 'App was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sy/apps/1
  def destroy
    @sy_app.destroy
    redirect_to sy_apps_url, notice: 'App was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sy_app
      @sy_app = Sy::App.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sy_app_params
      params.require(:sy_app).permit(:name, :abbr)
    end
end
