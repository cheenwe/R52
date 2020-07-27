class CreateSyApps < ActiveRecord::Migration[5.2]
  def change
    create_table :sy_apps do |t|
      t.string :name
      t.string :abbr

      t.timestamps
    end
  end
end
