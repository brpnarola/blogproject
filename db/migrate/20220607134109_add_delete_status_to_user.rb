class AddDeleteStatusToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :delete_status, :boolean, default: false
  end
end
