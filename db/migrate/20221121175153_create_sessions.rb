# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.integer :limit
      t.references :event, null: false, foreign_key: true, index: true
      t.references :session_type, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
