class CreateLcCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :lc_carriages do |t|
      t.integer :train_id

      t.timestamps
    end
  end
end
