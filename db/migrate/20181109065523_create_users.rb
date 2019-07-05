# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email
      t.string :password
      t.string :password_digest
      t.date :birth
      t.column :sex, :tinyint, null: false, default: 0
      t.text :introduction
      t.column :role, :tinyint, null: false, default: 0
      t.string :city
      t.string :country
      # t.datetime :token_at
      # t.string :verify_token

      t.timestamps
    end
    add_index :users, %i[email password]
  end
end
