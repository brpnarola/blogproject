class AddStatusToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_status, :boolean, default: false
  end
end
