class Lc::ImagesController < ApplicationController
  before_action :set_lc_image, only: [:show, :edit, :update, :destroy]

  # GET /lc/images
  def index
    @lc_images = Lc::Image.all
  end

  # GET /lc/images/1
  def show
  end

  # GET /lc/images/new
  def new
    @lc_image = Lc::Image.new
  end

  # GET /lc/images/1/edit
  def edit
  end

  # POST /lc/images
  def create
    @lc_image = Lc::Image.new(lc_image_params)

    if @lc_image.save
      redirect_to @lc_image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lc/images/1
  def update
    if @lc_image.update(lc_image_params)
      redirect_to @lc_image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lc/images/1
  def destroy
    @lc_image.destroy
    redirect_to lc_images_url, notice: 'Image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lc_image
      @lc_image = Lc::Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lc_image_params
      params.require(:lc_image).permit(:train_id, :carriage_id, :kind, :file)
    end
end
