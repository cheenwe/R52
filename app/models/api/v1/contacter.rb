# == Schema Information
#
# Table name: api_v1_contacters
#
#  id            :integer          not null, primary key
#  code          :string(255)
#  name          :string(255)
#  client_id     :integer
#  position_id   :integer
#  nickname      :string(255)
#  sex           :boolean
#  phone         :string(255)
#  mobile        :string(255)
#  email         :string(255)
#  birthday      :date
#  role_id       :integer
#  closelevel_id :integer
#  hobby         :string(255)
#  remark        :text
#  is_primary    :boolean
#  saler_id      :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  agent_id      :integer
#
# Indexes
#
#  index_api_v1_contacters_on_client_id      (client_id)
#  index_api_v1_contacters_on_closelevel_id  (closelevel_id)
#  index_api_v1_contacters_on_position_id    (position_id)
#  index_api_v1_contacters_on_role_id        (role_id)
#  index_api_v1_contacters_on_saler_id       (saler_id)
#  index_api_v1_contacters_on_user_id        (user_id)
#

class Api::V1::Contacter < ActiveRecord::Base
  #establish_connection("sale_crm".to_sym)
  self.table_name = 'api_v1_contacters'

  include HistoryBase
  include TrashBase

  validates :code, :uniqueness => true

  belongs_to :user, class_name: "::User"
  belongs_to :saler, class_name: "::User", foreign_key: :saler_id

  belongs_to :client, class_name: "Api::V1::Client"
  belongs_to :agent, class_name: "Api::V1::Agent"

  belongs_to :position, class_name: "Api::V1::Contacter::Position"
  belongs_to :role, class_name: "Api::V1::Contacter::Role"
  belongs_to :closelevel, class_name: "Api::V1::Contacter::Closelevel"

  has_many :stared, as: :starable, class_name: "StarUser", :foreign_key => :starable_id, :dependent => :destroy
  has_many :client_tracks, class_name: "Api::V1::ClientTrack"
  has_many :orders, class_name: "Api::V1::Order"

  before_create :generate_code

  def generate_code
    this_year = Date.today.year
    last_record_year = self.class.last.created_at.year rescue nil
    if this_year == last_record_year
        self.code = (self.class.last.code.next rescue "#{this_year.to_s[2..3]}0001")
    else
        self.code = "#{this_year.to_s[2..3]}0001"
    end
  end

  def self.create_process(user_id, contacter)
    Api::V1::Contacter.create(
      user_id: user_id,
      saler_id: user_id,

      client_id: contacter[:client_id],
      agent_id: contacter[:agent_id],
      name: contacter[:name],
      position_id: contacter[:position_id],
      phone: contacter[:phone],
      email: contacter[:email],
      mobile: contacter[:mobile],
      nickname: contacter[:nickname],
      remark: contacter[:remark],
    )
  end

  def self.update_process(user_id, contacter)
    @contacter = Api::V1::Contacter.where(code: contacter[:code]).last rescue ''

    @contacter.update(

      saler_id: user_id,
      client_id: contacter[:client_id],
      agent_id: contacter[:agent_id],
      name: contacter[:name],
      position_id: contacter[:position_id],
      phone: contacter[:phone],
      email: contacter[:email],
      mobile: contacter[:mobile],
      nickname: contacter[:nickname],
      remark: contacter[:remark],
    ) if contacter.present?
  end
end
