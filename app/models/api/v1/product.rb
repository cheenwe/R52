# == Schema Information
#
# Table name: api_v1_products
#
#  id           :integer          not null, primary key
#  code         :string(255)
#  name         :string(255)
#  standard     :string(255)
#  pattern      :string(255)
#  cost         :decimal(18, 6)
#  price        :decimal(18, 6)
#  use          :string(255)
#  explanation  :text
#  can_sale     :boolean
#  sales        :integer
#  sales_amount :decimal(18, 6)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_api_v1_products_on_user_id  (user_id)
#

class Api::V1::Product < ActiveRecord::Base
  include HistoryBase
  #establish_connection("sale_crm".to_sym)
  self.table_name = 'api_v1_products'
  validates_presence_of :name#, :code

  # has_many :attachments, class_name: "::Attachment", as: :attachmentable, :dependent => :destroy

  belongs_to :user, class_name: "::User"

  has_many :order_items, class_name: "Api::V1::OrderItem"
  has_many :clients, class_name: "Api::V1::Client"
  has_many :stared, as: :starable, class_name: "StarUser", :foreign_key => :starable_id, :dependent => :destroy

  before_create :generate_code

  def generate_code
      this_year = Date.today.year
      last_record_year = self.class.last.created_at.year rescue nil
      if this_year == last_record_year
          self.code = (self.class.last.code.next rescue "#{this_year.to_s}001")
      else
          self.code = "#{this_year.to_s}001"
      end
  end
end
