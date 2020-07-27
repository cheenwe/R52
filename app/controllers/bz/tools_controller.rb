class Bz::ToolsController < ApplicationController
  before_action :set_bz_tool, only: [:show, :edit, :update, :destroy]

  # GET /bz/tools
  # GET /bz/tools.json
  def index
    @bz_tools = Bz::Tool.all

    @q = @bz_tools.ransack(params[:q])
    @bz_tools = @q.result().paginate(:page => params[:page], :per_page => params[:per_page])
  end

  # GET /bz/tools/1
  # GET /bz/tools/1.json
  def show
  end

  # GET /bz/tools/new
  def new
    @bz_tool = Bz::Tool.new
  end

  # GET /bz/tools/1/edit
  def edit
  end

  # POST /bz/tools
  # POST /bz/tools.json
  def create
    @bz_tool = Bz::Tool.new(bz_tool_params)

    respond_to do |format|
      if @bz_tool.save
        format.html { redirect_to @bz_tool, notice: 'Tool was successfully created.' }
        format.json { render :show, status: :created, location: @bz_tool }
      else
        format.html { render :new }
        format.json { render json: @bz_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bz/tools/1
  # PATCH/PUT /bz/tools/1.json
  def update
    respond_to do |format|
      if @bz_tool.update(bz_tool_params).permit(:project, :name, :purpose, :remark, :url, :version)
        format.html { redirect_to @bz_tool, notice: 'Tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @bz_tool }
      else
        format.html { render :edit }
        format.json { render json: @bz_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bz/tools/1
  # DELETE /bz/tools/1.json
  def destroy
    @bz_tool.destroy
    respond_to do |format|
      format.html { redirect_to bz_tools_url, notice: 'Tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /bz/tools/1/upload
  def upload
    if request.get?
    else
      tool = Bz::Tool.find_by(name:bz_tool_params["name"])
      if tool.present?
        @version = Bz::Version.create(
          tool_id: tool.id,
          file: params[:file],
          remark: bz_tool_params["remark"],
          )
        tool.update(
            purpose: bz_tool_params["purpose"],
            remark: bz_tool_params["remark"],
            version: @version.version,
            url:@version.file.url
          )
      else
        @bz_tool = Bz::Tool.create(bz_tool_params)

        @version = Bz::Version.create(
          tool_id: @bz_tool.id,
          file: params[:file],
          remark: bz_tool_params["remark"],
          )
          @bz_tool.update(version:@version.version,url:@version.file.url)

      end

      respond_to do |format|
        format.html { redirect_to "/bz/tool/upload", notice: 'Tool was  successfully created.' }
        format.json { render :show, status: :created, location: @bz_tool }
      end
    end
  end

  def down
    url = params[:url]
    file =Rails.root.join("public/#{url}")
    p file
    send_data File.read(file), :filename => params[:name]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bz_tool
      @bz_tool = Bz::Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bz_tool_params
      params.require(:bz_tool).permit(:project, :name, :purpose, :remark, :url, :version)
    end
end
