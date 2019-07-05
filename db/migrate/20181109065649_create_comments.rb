# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, index: true
      t.string :commentable_type
      t.column :commentable_id, :bigint
      t.text :content, null: false

      t.timestamps
    end
  end
end
