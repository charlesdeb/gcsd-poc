class AddPresenterBioToSessions < ActiveRecord::Migration[7.0]
  def change

    add_column :sessions, :presenter_bio_override, :text

    change_column_comment(
      :sessions,
      :presenter_bio_override,
      from: '',
      to: 'Override the bio of the presenter(s) for the session if a) there is more than one presenter, or b) the session\'s presenter needs a special bio'
    )
  end
end
