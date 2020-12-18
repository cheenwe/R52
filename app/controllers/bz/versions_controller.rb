class Bz::VersionsController < ApplicationController
  before_action :set_bz_version, only: [:show, :edit, :update, :destroy]

  skip_before_action :base_authenticate,:verify_authenticity_token, only: [:monitor]
  # GET /bz/versions
  # GET /bz/versions.json
  def index
    # @bz_versions = Bz::Version.all

    @bz_versions = Bz::Version.order("id desc")

    @q = @bz_versions.ransack(params[:q])
    @bz_versions = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])
  end


  def monitor
    p params
    reason = {}
    alarm_at = params
    
    @bz_version = Bz::Version.new(remark: params)
    @bz_version.file =  params["hostname"]
    
    @bz_version.save
    
    render json:  {"code": 200, "message": "success", "status": true}
  end

  # GET /bz/versions/1
  # GET /bz/versions/1.json
  def show
  end

  # GET /bz/versions/new
  def new
    @bz_version = Bz::Version.new
  end

  # GET /bz/versions/1/edit
  def edit
  end

  # POST /bz/versions
  # POST /bz/versions.json
  def create
    @bz_version = Bz::Version.new(bz_version_params)

    respond_to do |format|
      if @bz_version.save
        format.html { redirect_to @bz_version, notice: 'Version was successfully created.' }
        format.json { render :show, status: :created, location: @bz_version }
      else
        format.html { render :new }
        format.json { render json: @bz_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bz/versions/1
  # PATCH/PUT /bz/versions/1.json
  def update
    respond_to do |format|
      if @bz_version.update(bz_version_params)
        format.html { redirect_to @bz_version, notice: 'Version was successfully updated.' }
        format.json { render :show, status: :ok, location: @bz_version }
      else
        format.html { render :edit }
        format.json { render json: @bz_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bz/versions/1
  # DELETE /bz/versions/1.json
  def destroy
    @bz_version.destroy
    respond_to do |format|
      format.html { redirect_to bz_versions_url, notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bz_version
      @bz_version = Bz::Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bz_version_params
      params.require(:bz_version).permit(:tool_id, :file, :version, :remark)
    end
end
