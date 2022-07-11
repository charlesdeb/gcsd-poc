# frozen_string_literal: true

class ChangeUserRoleDefault < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :role, :integer, null: false, default: nil
  end

  def down
    change_column :users, :role, :integer, default: 0
  end
end
