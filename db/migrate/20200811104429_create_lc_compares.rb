class CreateLcCompares < ActiveRecord::Migration[5.2]
  def change
    create_table :lc_compares do |t|
      t.integer :train_id
      t.integer :carriage_id
      t.string :old_file
      t.string :new_file
      t.integer :result
      t.string :reason
      t.string :result_file

      t.timestamps
    end
  end
end
