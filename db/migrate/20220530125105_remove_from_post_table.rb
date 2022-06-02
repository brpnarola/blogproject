class RemoveFromPostTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :approval, :boolean
  end
end
