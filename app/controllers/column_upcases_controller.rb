class ColumnUpcasesController < ApplicationController
  before_action :set_column_upcase, only: [:show, :edit, :update, :destroy]

  # GET /column_upcases
  def index
    @column_upcases = ColumnUpcase.all
  end

  # GET /column_upcases/1
  def show
  end

  # GET /column_upcases/new
  def new
    @column_upcase = ColumnUpcase.new
  end

  # GET /column_upcases/1/edit
  def edit
  end

  # POST /column_upcases
  def create
    @column_upcase = ColumnUpcase.new(column_upcase_params)

    if @column_upcase.save
      redirect_to @column_upcase, notice: 'Column upcase was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /column_upcases/1
  def update
    if @column_upcase.update(column_upcase_params)
      redirect_to @column_upcase, notice: 'Column upcase was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /column_upcases/1
  def destroy
    @column_upcase.destroy
    redirect_to column_upcases_url, notice: 'Column upcase was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column_upcase
      @column_upcase = ColumnUpcase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def column_upcase_params
      params.require(:column_upcase).permit(:contect, :result)
    end
end
