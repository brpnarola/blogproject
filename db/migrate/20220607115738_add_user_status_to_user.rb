class AddUserStatusToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_status, :boolean, default: false  
  end
end
