class ChangeRemarkToText < ActiveRecord::Migration[5.2]
  def change
    change_column :bz_versions, :remark, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
