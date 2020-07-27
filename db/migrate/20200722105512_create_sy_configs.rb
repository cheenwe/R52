class CreateSyConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :sy_configs do |t|
      t.string :var
      t.string :value

      t.timestamps
    end
  end
end
