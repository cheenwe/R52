class AddAlarmNumToSyApps < ActiveRecord::Migration[5.2]
  def change
    add_column :sy_services, :alarm_at, :datetime
    add_column :sy_services, :alarm_num, :integer
    add_column :sy_services, :alarm_mail, :string
  end
end
