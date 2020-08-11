class Lc::ComparesController < ApplicationController
  before_action :set_lc_compare, only: [:show, :edit, :update, :destroy]

  # GET /lc/compares
  def index
    @lc_compares = Lc::Compare.all
  end

  # GET /lc/compares/1
  def show
  end

  # GET /lc/compares/new
  def new
    @lc_compare = Lc::Compare.new
  end

  # GET /lc/compares/1/edit
  def edit
  end

  # POST /lc/compares
  def create
    @lc_compare = Lc::Compare.new(lc_compare_params)

    if @lc_compare.save
      redirect_to @lc_compare, notice: 'Compare was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lc/compares/1
  def update
    if @lc_compare.update(lc_compare_params)
      redirect_to @lc_compare, notice: 'Compare was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lc/compares/1
  def destroy
    @lc_compare.destroy
    redirect_to lc_compares_url, notice: 'Compare was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lc_compare
      @lc_compare = Lc::Compare.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lc_compare_params
      params.require(:lc_compare).permit(:train_id, :carriage_id, :old_file, :new_file, :result, :reason, :result_file)
    end
end
