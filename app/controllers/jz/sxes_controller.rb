class Jz::SxesController < ApplicationController
  before_action :set_jz_sx, only: [:show, :edit, :update, :destroy]

  protect_from_forgery with: :null_session, only: [:sx]

  def sx
    if request.get? 
    elsif request.post?

      # Jz::Sx.create(
      #   user_id: params[:user][:user_id],
      #   start_at: Time.now,
      # )
      # @notices ='签到成功.'
      if  params[:user][:user_id].present?
        if Jz::Sx.today.where(user_id:params[:user][:user_id]).present?
          jz_sx = Jz::Sx.today.where(user_id:params[:user][:user_id]).last
          jz_sx.update(end_at:Time.now)
          @notices ='签退成功.'
        else
          # Jz::Record.create(
          #   user_id: params[:user][:user_id],
          #   enter_at: Time.now,
          #   is_first: false
          # )

          Jz::Sx.create(
            user_id: params[:user][:user_id],
            start_at: Time.now,
          )
          @notices ='签到成功.'
        end
      end
    end
  end

  # GET /jz/sxes
  # GET /jz/sxes.json
  def index
    # @jz_sxes = Jz::Sx.all

    @q = Jz::Sx.order("id DESC").ransack(params[:q])
    @datas = @q.result()
    @jz_sxes = @datas.paginate(:page => params[:page], :per_page => 30) 

    @arr = []
    Jz::User::SHIXI_NAME.each do |name|
      id = Jz::User.find_by(name:name).id
     @arr << {
       id: id,
       size: @datas.where(user_id: id).size,
       name: name,
      }
      
    end

  end

  # GET /jz/sxes/1
  # GET /jz/sxes/1.json
  def show
  end

  # GET /jz/sxes/new
  def new
    @jz_sx = Jz::Sx.new
  end

  # GET /jz/sxes/1/edit
  def edit
  end

  # POST /jz/sxes
  # POST /jz/sxes.json
  def create
    @jz_sx = Jz::Sx.new(jz_sx_params)

    respond_to do |format|
      if @jz_sx.save
        format.html { redirect_to @jz_sx, notice: 'Sx was successfully created.' }
        format.json { render :show, status: :created, location: @jz_sx }
      else
        format.html { render :new }
        format.json { render json: @jz_sx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jz/sxes/1
  # PATCH/PUT /jz/sxes/1.json
  def update
    respond_to do |format|
      if @jz_sx.update(jz_sx_params)
        format.html { redirect_to @jz_sx, notice: 'Sx was successfully updated.' }
        format.json { render :show, status: :ok, location: @jz_sx }
      else
        format.html { render :edit }
        format.json { render json: @jz_sx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jz/sxes/1
  # DELETE /jz/sxes/1.json
  def destroy
    @jz_sx.destroy
    respond_to do |format|
      format.html { redirect_to jz_sxes_url, notice: 'Sx was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jz_sx
      @jz_sx = Jz::Sx.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jz_sx_params
      params.require(:jz_sx).permit(:user_id, :name, :start_at, :end_at)
    end

end
