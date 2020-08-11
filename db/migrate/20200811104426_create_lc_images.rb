class CreateLcImages < ActiveRecord::Migration[5.2]
  def change
    create_table :lc_images do |t|
      t.integer :train_id
      t.integer :carriage_id
      t.integer :kind
      t.string :file

      t.timestamps
    end
  end
end
