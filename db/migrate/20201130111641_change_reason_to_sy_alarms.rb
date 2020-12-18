class ChangeReasonToSyAlarms < ActiveRecord::Migration[5.2]
  def change
    change_column :sy_alarms, :reason, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
