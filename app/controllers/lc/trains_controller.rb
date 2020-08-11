class Lc::TrainsController < ApplicationController
  before_action :set_lc_train, only: [:show, :edit, :update, :destroy]

  # GET /lc/trains
  def index
    @lc_trains = Lc::Train.all
  end

  # GET /lc/trains/1
  def show
  end

  # GET /lc/trains/new
  def new
    @lc_train = Lc::Train.new
  end

  # GET /lc/trains/1/edit
  def edit
  end

  # POST /lc/trains
  def create
    @lc_train = Lc::Train.new(lc_train_params)

    if @lc_train.save
      redirect_to @lc_train, notice: 'Train was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lc/trains/1
  def update
    if @lc_train.update(lc_train_params)
      redirect_to @lc_train, notice: 'Train was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lc/trains/1
  def destroy
    @lc_train.destroy
    redirect_to lc_trains_url, notice: 'Train was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lc_train
      @lc_train = Lc::Train.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lc_train_params
      params.require(:lc_train).permit(:uuid, :code, :name)
    end
end
