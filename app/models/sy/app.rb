# == Schema Information
#
# Table name: sy_apps
#
#  id         :integer          not null, primary key
#  abbr       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sy::App < ApplicationRecord

    # after_update :force_update_cache_date

    #  根据 id 获取 abbr 值并缓存,减少 where 查询
    # Sy::App.check_abbr("NB")
    def self.check_abbr(abbr, force=true)
        app = Sy::App.find_by(abbr: abbr)
        # p app
        if app.present?
          return app.id
        else
          app = Sy::App.create(abbr: abbr)
          return app.id
        end
    end


end
