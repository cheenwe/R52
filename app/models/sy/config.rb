# == Schema Information
#
# Table name: sy_configs
#
#  id         :bigint           not null, primary key
#  value      :string(255)
#  var        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sy::Config < ApplicationRecord


  class << self
    # Sy::Config.cfg(id)
    def cfg(id)
      @site_config = Sy::Config.find_by(var: id).value rescue (Sy::Config.create(var: id).value rescue nil)
    end
    # Sy::Config.cfg(id)
    def vue(id)
      @site_config = Sy::Config.find_by(var: id).value rescue (Sy::Config.create(var: id).value rescue nil )
    end
  end
end
