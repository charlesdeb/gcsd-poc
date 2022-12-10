# frozen_string_literal: true

class RemoveI18nedColumns < ActiveRecord::Migration[7.0]
  def up
    remove_column :events, :title

    remove_column :session_types, :name
    remove_column :session_types, :description

    remove_column :pages, :title
  end

  def down
    add_column :events, :title, :string, limit: 40

    add_column :session_types, :name, :string, limit: 40
    add_column :session_types, :description, :string, limit: 100

    add_column :pages, :title, :string, limit: 40
  end
end
