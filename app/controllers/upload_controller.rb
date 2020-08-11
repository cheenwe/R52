class UploadController < ApplicationController

  def index
    if request.post? && params[:train] == "1"
      gen_train #生成列车数据
    elsif request.post?
      upload_image # 上传文件

Lc::Image


    end
  end

  def result

  end

  private

    def gen_train
      train = Lc::Train.create(uuid: params[:uuid])

      render :json => {
        code: 200,
        msg: "ok",
        success: 1,
        # meta: { total: @items.total_entries, per_page: @items.per_page },
        data: train.id,#.fields_for_list.map { |e|e.base_info  },
      }, :status => 200
    end

    def upload_image
      image = Lc::Image.create(
        file: params[:file],
        kind: params[:kind],
        train_id: params[:train_id],
        )

      render :json => {
        code: 200,
        msg: "ok",
        success: 1,
        # meta: { total: @items.total_entries, per_page: @items.per_page },
        data: image.id,#.fields_for_list.map { |e|e.base_info  },
      }, :status => 200
    end
end
