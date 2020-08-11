class CreateLcTrains < ActiveRecord::Migration[5.2]
  def change
    create_table :lc_trains do |t|
      t.string :uuid
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
