# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, limit: 40
      t.date :starting_at
      t.string :status, limit: 15
      t.text :description
      t.boolean :is_featured

      t.timestamps
    end
    add_index :events, :title
    add_index :events, :starting_at
  end
end
