class AddSlugFinishingAtToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :slug, :string, limit: 30
    add_index :events, :slug, unique: true
    add_column :events, :finishing_at, :time
  end
end
