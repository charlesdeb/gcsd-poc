class AddRegistrationUrlToEvents < ActiveRecord::Migration[7.0]
  def change
    # add_column :events, :featured_image_caption, :text

    # change_table_comment(:events, from: '', to: 'Used for alt tags and captions')

    add_column :events, :registration_url, :text

    change_column_comment(:events, :slug, from: '', to: 'a URL for registering with an external site like EventBrite')
  end
end
