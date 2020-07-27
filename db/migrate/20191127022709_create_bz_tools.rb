class CreateBzTools < ActiveRecord::Migration[5.2]
  def change
    create_table :bz_tools do |t|
      t.string :project
      t.string :name
      t.string :purpose
      t.string :remark
      t.string :url
      t.string :version

      t.timestamps
    end
  end
end
