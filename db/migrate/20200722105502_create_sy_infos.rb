class CreateSyInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :sy_infos do |t|
      t.integer :service_id
      t.integer :state
      t.datetime :send_at
      t.string :reason

      t.timestamps
    end
  end
end
