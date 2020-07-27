class CreateSyAlarms < ActiveRecord::Migration[5.2]
  def change
    create_table :sy_alarms do |t|
      t.integer :service_id
      t.datetime :alarm_at
      t.string :reason

      t.timestamps
    end
  end
end
