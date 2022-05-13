class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :address
      t.timestamps
    end
    add_index :members, :first_name
    add_index :members, :last_name
  end
end
