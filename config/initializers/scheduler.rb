
#
# config/initializers/scheduler.rb

require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

return if   defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'

# do not schedule when Rails is run from its console, for a test/spec, or
# from a Rake task

s.every '5m' do
  Rails.logger.info "====== 开启定期检查, #{Time.now}"
  Rails.logger.info  Sy::Service.where.not(is_open: false).size

  Sy::Service.where.not(is_open: false).each do |service|
    # Rails.logger.info service.id
    service.check_is_alarm

  end
  Rails.logger.flush

end
# require 'rufus-scheduler'

# scheduler = Rufus::Scheduler.new

# scheduler.in '3s' do
#   puts "Hello... Rufus : #{Time.now}"
# end


scheduler.every '24h' do
  # do something every 3 hours
  Rails.logger.info "====== 开启定期检查域用户信息, #{Time.now}"
  Ldap.search_all_users
  Rails.logger.flush
end
# # scheduler.every '3h10m' do
# #   # do something every 3 hours and 10 minutes
# # end
# # scheduler.cron '5 0 * * *' do
# #   # do something every day, five minutes after midnight
# #   # (see "man 5 crontab" in your terminal)
# # end

# scheduler.join
