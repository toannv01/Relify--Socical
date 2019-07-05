# frozen_string_literal: true

class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.references :user, foreign_key: true, index: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
