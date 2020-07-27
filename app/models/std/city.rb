# == Schema Information
#
# Table name: std_cities
#
#  code          :string(255)      not null, primary key
#  name          :string(255)
#  province_code :string(255)
#

module Std
  class City < ActiveRecord::Base
    # #establish_connection("sale_crm".to_sym)
    # self.table_name = 'std_cities'
      # self.table_name = 'std_cities'
      # second_level_cache expires_in: 1.year
      belongs_to :province, class_name: "Std::Province", foreign_key: :province_code

      # has_many :areas, class_name: "Std::Area", foreign_key: :city_code
      # has_many :streets, class_name: "Std::Street", through: :areas
      # has_many :villages, class_name: "Std::Village", through: :streets

      #Std::City.short_name
      def self.short_name
          a = Std::City.all.sample.name
          if a.size < 5 && a != "市辖区"
              a
          else
              short_name
          end
      end
  end
end

