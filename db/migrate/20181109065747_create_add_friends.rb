# frozen_string_literal: true

class CreateAddFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :add_friends do |t|
      t.references :user, foreign_key: true, index: true
      t.integer :friend_id
      t.column :status, :tinyint, default: 0

      t.timestamps
    end
  end
end
