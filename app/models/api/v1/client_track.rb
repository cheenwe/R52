# == Schema Information
#
# Table name: api_v1_client_tracks
#
#  :id,           :integer          not null, primary key
#  :client_id,    :integer
#  :contacter_id, :integer
#  :category_id,  :integer
#  :comment,      :string(255)
#  :next_action,  :text
#  :other,        :text
#  :saler_id,     :integer
#  :user_id,      :integer
#  :created_at,   :datetime
#  :updated_at,   :datetime
#  :visit_at,     :datetime
#  :place,        :string(255)
#  :background,   :text
#  :puzzled,      :text
#  :requirement,  :text
#  :status_id,    :integer
#
# Indexes
#
#  index_api_v1_client_tracks_on_category_id   (category_id)
#  index_api_v1_client_tracks_on_client_id     (client_id)
#  index_api_v1_client_tracks_on_contacter_id  (contacter_id)
#  index_api_v1_client_tracks_on_saler_id      (saler_id)
#  index_api_v1_client_tracks_on_user_id       (user_id)
#

class Api::V1::ClientTrack < ActiveRecord::Base
  include HistoryBase
  include TrashBase

  serialize :next_action, Hash
  serialize :other, Hash
  serialize :background, Hash
  serialize :puzzled, Hash
  serialize :requirement, Hash

  belongs_to :saler, class_name: "::User"
  belongs_to :user, class_name: "::User"
  belongs_to :client, class_name: "Api::V1::Client"
  belongs_to :status, class_name: "Api::V1::Client::Status"
  belongs_to :contacter, class_name: "Api::V1::Contacter"
  belongs_to :category, class_name: "Api::V1::ClientTrack::Category"

  has_many :stared, as: :starable, class_name: "StarUser", :foreign_key => :starable_id, :dependent => :destroy

  has_many :item_users, class_name: "ItemUser", as: :itemable, :dependent => :destroy
  has_many :users, :through => :item_users, :source => :user

  has_many :item_contacters, class_name: "ItemContacter", as: :itemable, :dependent => :destroy
  has_many :contacters, :through => :item_contacters, :source => :contacter

  after_update :upgrade_client_status_id
  after_create :upgrade_client_status_id

  def upgrade_client_status_id
    p self.client.client_tracks.last.id
    p self.id

    if self.client.client_tracks.last.id == self.id
      self.client.update_columns(status_id: self.status_id, updated_at: Time.now)
    else

    end
  end
  # Api::V1::ClientTrack.track_summary
  def self.track_summary
    arr = []
    User.all_salers.each do |user|
        list =[]
        month =[]
        year = Date.today.year
       (1..Date.today.month).each do |month|
        size = Api::V1::ClientTrack.sum_one_month_amount(user.id, year, month)
        list.push [size, "#{year}-#{month}-1", "#{year}-#{month}-31"]
       end
        list.push [Api::V1::ClientTrack.where(user_id:user.id ).length, "", ""]
      arr << {"username": user.username, "user_id": user.id, data: list}
    end
    arr
  end

  # Api::V1::ClientTrack.track_month
  def self.track_month
    month_list =[]
    (1..Date.today.month).each do |month|
      month_list.push "#{month}月"
    end
    month_list.push "全部"
    month_list
  end


  # Api::V1::ClientTrack.sum_one_month_amount(user, '2015', 1)
  def self.sum_one_month_amount(user_id, year, month)
      time_min = Time.new(year, month)
      time_max = time_min +1.month
      # arr_data << time_max.month
      amount = Api::V1::ClientTrack.where('user_id =?  AND visit_at < ? AND visit_at >= ?',user_id, time_max, time_min).length
      amount
  end



end
