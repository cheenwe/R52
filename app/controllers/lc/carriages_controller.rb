class Lc::CarriagesController < ApplicationController
  before_action :set_lc_carriage, only: [:show, :edit, :update, :destroy]

  # GET /lc/carriages
  def index
    @lc_carriages = Lc::Carriage.all
  end

  # GET /lc/carriages/1
  def show
  end

  # GET /lc/carriages/new
  def new
    @lc_carriage = Lc::Carriage.new
  end

  # GET /lc/carriages/1/edit
  def edit
  end

  # POST /lc/carriages
  def create
    @lc_carriage = Lc::Carriage.new(lc_carriage_params)

    if @lc_carriage.save
      redirect_to @lc_carriage, notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lc/carriages/1
  def update
    if @lc_carriage.update(lc_carriage_params)
      redirect_to @lc_carriage, notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lc/carriages/1
  def destroy
    @lc_carriage.destroy
    redirect_to lc_carriages_url, notice: 'Carriage was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lc_carriage
      @lc_carriage = Lc::Carriage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lc_carriage_params
      params.require(:lc_carriage).permit(:train_id)
    end
end
