# frozen_string_literal: true

class AddActivationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activated, :boolean, default: false
  end
end
