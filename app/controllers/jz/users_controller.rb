class Jz::UsersController < ApplicationController
  before_action :set_jz_user, only: [:show, :edit, :update, :destroy]

  protect_from_forgery with: :null_session


  def jz
    if request.get?
      # 查询用户
      if params[:search] == "true"
        users = Jz::User.where(name:params[:name])
        if users.present?
          @has_come = 1
          @jz_user = users.last

          @notices ='请点击签到.' 
        else
          @has_come = 0
          @jz_user = Jz::User.new
          @jz_user.name = params[:name]
          @notices ='请先登记个人信息.'
        end
      else
        
      end
    elsif request.post?
      # 判断该用户当天是否已经签到

      if  params[:user_id].present?
        if Jz::Record.today.where(user_id:params[:user_id]).present?
          @notices ='你今天已签到，请勿重复操作.'
        else
          Jz::Record.create(
            user_id: params[:user_id],
            enter_at: Time.now,
            is_first: false
          )
          @notices ='签到成功.'
        end

      #  if enter_at < Time.now.beginning_of_day
      else
        @jz_user = Jz::User.create(
          name: params[:name],
          phone: params[:phone],
          alipay: params[:alipay],
          id_card: params[:id_card],
          
        )
        # @jz_user.code = Jz::User.last.code
        Jz::Record.create(
          user_id: @jz_user.id,
          enter_at: Time.now,
          is_first: true
        )
        @notices ='签到成功.'
      end

      # respond_to do |format|
      #   format.html { redirect_to :jz, notice: @notices }
      # end
    end

  end


  # GET /jz/users
  # GET /jz/users.json
  def index
    @jz_users = Jz::User.all
  end

  # GET /jz/users/1
  # GET /jz/users/1.json
  def show
  end

  # GET /jz/users/new
  def new
    @jz_user = Jz::User.new
  end

  # GET /jz/users/1/edit
  def edit
  end

  # POST /jz/users
  # POST /jz/users.json
  def create
    @jz_user = Jz::User.new(jz_user_params)

    respond_to do |format|
      if @jz_user.save
        format.html { redirect_to jz_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @jz_user }
      else
        format.html { render :new }
        format.json { render json: @jz_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jz/users/1
  # PATCH/PUT /jz/users/1.json
  def update
    respond_to do |format|
      if @jz_user.update(jz_user_params)
        format.html { redirect_to @jz_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @jz_user }
      else
        format.html { render :edit }
        format.json { render json: @jz_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jz/users/1
  # DELETE /jz/users/1.json
  def destroy
    @jz_user.destroy
    respond_to do |format|
      format.html { redirect_to jz_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jz_user
      @jz_user = Jz::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jz_user_params
      params.require(:jz_user).permit(:code, :name, :phone, :alipay, :rate, :remark, :id_card, :this_month_num)
    end
end
