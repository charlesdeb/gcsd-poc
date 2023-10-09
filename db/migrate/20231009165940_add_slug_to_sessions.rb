class AddSlugToSessions < ActiveRecord::Migration[7.0]
  def up
    add_column :sessions, :slug, :text
    add_index :sessions, :slug, unique: true

    Session.all.each do |session| 
      session.slug = nil 
      session.save
    end
  end

  def down
    remove_column :sessions, :slug, :text
  end
end
