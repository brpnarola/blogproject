class AddDeleteStatusToPost < ActiveRecord::Migration[6.0]
  def change
   add_column :posts, :post_delete_status, :boolean, default: false
  end
end
