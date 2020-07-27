class CreateBzVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :bz_versions do |t|
      t.integer :tool_id
      t.string :file
      t.string :version
      t.string :remark

      t.timestamps
    end
  end
end
