class AddStateToSyServices < ActiveRecord::Migration[5.2]
  def change
    add_column :sy_services, :state, :integer
  end
end
