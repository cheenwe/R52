class CreateSyServices < ActiveRecord::Migration[5.2]
  def change
    create_table :sy_services do |t|
      t.integer :app_id
      t.string :name
      t.string :abbr
      t.string :remark
      t.boolean :is_open, default: 1

      t.timestamps
    end
  end
end
