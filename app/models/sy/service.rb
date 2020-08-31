# == Schema Information
#
# Table name: sy_services
#
#  id         :integer          not null, primary key
#  abbr       :string
#  alarm_at   :datetime
#  alarm_mail :string
#  alarm_num  :integer
#  is_open    :boolean          default(TRUE)
#  name       :string
#  remark     :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  app_id     :integer
#
class Sy::Service < ApplicationRecord
    belongs_to :app, class_name: "Sy::App"

    # after_create :check_alarm

    #  根据 id 获取 abbr 值并缓存,减少 where 查询
    # Sy::Service.check_abbr("NB", "n1")
    def self.check_abbr(app_abbr, abbr)
        app_id = Sy::App.check_abbr(app_abbr)
        ses = Sy::Service.where(app_id: app_id, abbr: abbr)

        if ses.present?
          return ses.last.id
        else
          ses = Sy::Service.create(app_id: app_id, abbr: abbr)
          return ses.id
        end
    end

    def check_is_alarm
      second = Time.now - self.updated_at
      # p second
      # p second > 5.minutes

      # 应用开启监控并且状态为异常
      if second > 5.minutes
        Rails.logger.info "find alarm: #{self.id}"
        str = ago_in_words(second,true)
        reason = "[定时监测]服务状态异常:  #{ago_in_words(second,true)} 未收到服务推送!"
        update(state:1, remark: reason)

        Sy::Alarm.create(service_id: self.id, alarm_at: Time.now, reason: reason)
      end

    end



    # Sy::Service.new.ago_in_words(,true)

    def ago_in_words(date, is_secs=false)

      # p date
      # p date
      # p date
      # p date
      # p date
      # p date
      if is_secs == true
        secs = date.to_i
      else
        return '很久以前' if date.year < 1800
        secs = Time.now - date
      end
      if  secs <= -1
        res = ''
      elsif secs > -1 && secs < 1
        res = '刚刚'
      elsif secs < 1.minute
        res = "#{secs.to_i} 秒"
      elsif  secs < 7.days #小于 7天
        pair = ago_in_words_pair(secs)
        ary = ago_in_words_singularize(pair)
        res = ary.size == 0 ? '' : ary.join(' ')
      else  #大于 7天
        pair = ago_in_words_pair(secs)
        pair_days = pair[0].split(" ")[0].to_i
        # p pair
        # p pair_days
        if  secs < 28.days #周
          pair_days = pair_days.divmod(7)
          pair = ["#{pair_days[0]} 周", "#{pair_days[1]} 天"]
        elsif secs < 365.days #月
          pair_days = pair_days.divmod(30)
          pair = ["#{pair_days[0]} 月", "#{pair_days[1]} 天"]
        else #年
          pair_days = pair_days.divmod(365)
          pair = ["#{pair_days[0]} 年", "#{pair_days[1]} 天"]
        end
        ary = ago_in_words_singularize(pair)
        res = ary.size == 0 ? '' : ary.join(' ')
      end
      return res
    end

    # @private
    def ago_in_words_pair(secs)
      [[60, :秒], [60, :分钟], [24, :小时], [1.days.to_i, :天], [1.week.to_i, :周], [1.month.to_i, :月], [1.year.to_i, :年]].map{ |count, name|
        if secs > 0
          secs, n = secs.divmod(count)
          "#{n.to_i} #{name}"
        end
      }.compact.reverse[0..1]
    end

    # @private
    def ago_in_words_singularize(pair)
      # p pair
      if pair.size == 1
        pair.map! {|part| part[0, 2].to_i == 1 ? part.chomp('s') : part }
      else
        pair.map! {|part| part[0, 2].to_i == 1 ? part.chomp('s') : part[0, 2].to_i == 0 ? nil : part }
      end
      pair.compact
    end

end
