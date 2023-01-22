class ChangeStringColumnsToText < ActiveRecord::Migration[7.0]
  def up
    change_column :events, :status, :text
    change_column :events, :slug, :text
    change_column :pages, :slug, :text
    change_column :presenters, :name, :text
  end

  def down
    change_column :events, :status, :string, limit: 15
    change_column :events, :slug, :string, limit: 30
    change_column :pages, :slug, :string, limit: 30
    change_column :presenters, :name, :string
  end
end
