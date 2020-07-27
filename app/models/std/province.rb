# == Schema Information
#
# Table name: std_provinces
#
#  code :string(255)      not null, primary key
#  name :string(255)
#


module Std
  class Province < ActiveRecord::Base
    # #establish_connection("sale_crm".to_sym)
    # self.table_name = 'std_provinces'
    # self.table_name = 'std_provinces'
    # second_level_cache expires_in: 1.year

    has_many :cities, class_name: "Std::City", foreign_key: :province_code
    # has_many :areas, class_name: "Std::Area", through: :cities
    # has_many :streets, class_name: "Std::Street", through: :areas
    # has_many :villages, class_name: "Std::Village", through: :streets

  end
end

