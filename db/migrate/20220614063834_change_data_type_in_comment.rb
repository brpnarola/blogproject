class ChangeDataTypeInComment < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :description, :text
  end
end
