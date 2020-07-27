class CreateColumnUpcases < ActiveRecord::Migration[5.2]
  def change
    create_table :column_upcases do |t|
      t.text :contect
      t.text :result

      t.timestamps
    end
  end
end
