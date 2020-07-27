class CreateCloumnDowns < ActiveRecord::Migration[5.2]
  def change
    create_table :cloumn_downs do |t|
      t.string :name
      t.string :result

      t.timestamps
    end
  end
end
