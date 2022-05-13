# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
