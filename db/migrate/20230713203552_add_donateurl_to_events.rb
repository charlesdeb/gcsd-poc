class AddDonateurlToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :donation_url, :text

    change_column_comment(
      :events,
      :donation_url,
      from: '',
      to: 'A URL, probably at EventBrite, where a donation can be made.'
    )
  end
end
