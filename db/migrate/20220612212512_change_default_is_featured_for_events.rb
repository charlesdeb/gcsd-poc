# frozen_string_literal: true

class ChangeDefaultIsFeaturedForEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :is_featured, :boolean, default: false
  end
end
