class AddApprovalColumnToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :approval, :boolean, default: false
  end
end
