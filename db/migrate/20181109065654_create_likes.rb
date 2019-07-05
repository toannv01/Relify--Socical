# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, index: true
      t.string :likable_type
      t.column :likable_id, :bigint

      t.timestamps
    end
  end
end
