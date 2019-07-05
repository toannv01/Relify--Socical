# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image
      t.references :user,foreign_key: true, index: true
      t.integer :relate_type, default: 2
      t.integer :image_able_id
      t.string :image_able_type

      t.timestamps
    end
  end
end
