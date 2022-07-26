class RemoveBodyFromPages < ActiveRecord::Migration[7.0]
  def change
    remove_column :pages, :body, :text
  end
end
