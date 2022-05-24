# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :title, limit: 50
      t.string :slug, limit: 30
      t.text :body

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
