# == Schema Information
#
# Table name: api_v1_properties
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Api::V1::Property < ActiveRecord::Base
  #establish_connection("sale_crm".to_sym)
  self.table_name = 'api_v1_properties'
  validates :name, :presence => true
end
