class AddStateToJzUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :jz_users, :state, :integer
  end
end
