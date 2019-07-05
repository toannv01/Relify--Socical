# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true, index: true
      t.string :trackable_type
      t.column :trackable_id, :bigint
      t.column :type, :tinyint

      t.timestamps
    end
  end
end
