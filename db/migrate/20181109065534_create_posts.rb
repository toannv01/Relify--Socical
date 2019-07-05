# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, index: true
      t.text :context
      t.integer :like_count, default: 0
      t.integer :comments_count, default: 0
      t.boolean :block

      t.timestamps
    end
  end
end
