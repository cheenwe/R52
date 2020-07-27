class CreateJzUsers < ActiveRecord::Migration[5.2]
  def change

    create_table "jz_records", force: :cascade do |t|
      t.integer "user_id"
      t.datetime "enter_at"
      t.boolean "is_first"
      t.integer "computer_num"
      t.string "remark"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "jz_sxes", force: :cascade do |t|
      t.integer "user_id"
      t.string "name"
      t.datetime "start_at"
      t.datetime "end_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "jz_users", force: :cascade do |t|
      t.string "code"
      t.string "name"
      t.string "phone"
      t.string "alipay"
      t.integer "rate"
      t.string "remark"
      t.integer "this_month_num"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "id_card"
    end
  end
end
