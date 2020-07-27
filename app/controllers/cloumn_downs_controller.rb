class CloumnDownsController < ApplicationController
  before_action :set_cloumn_down, only: [:show, :edit, :update, :destroy]

  # GET /cloumn_downs
  def index
    @cloumn_downs = CloumnDown.all
  end

  # GET /cloumn_downs/1
  def show
  end

  # GET /cloumn_downs/new
  def new
    @cloumn_down = CloumnDown.new
  end

  # GET /cloumn_downs/1/edit
  def edit
  end

  # POST /cloumn_downs
  def create
    @cloumn_down = CloumnDown.new(cloumn_down_params)

    if @cloumn_down.save
      redirect_to @cloumn_down, notice: 'Cloumn down was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cloumn_downs/1
  def update
    if @cloumn_down.update(cloumn_down_params)
      redirect_to @cloumn_down, notice: 'Cloumn down was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cloumn_downs/1
  def destroy
    @cloumn_down.destroy
    redirect_to cloumn_downs_url, notice: 'Cloumn down was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloumn_down
      @cloumn_down = CloumnDown.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cloumn_down_params
      params.require(:cloumn_down).permit(:name, :result)
    end
end
