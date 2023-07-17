class AddEventIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :default_event, foreign_key: { to_table: :events }

    change_column_comment(
      :users,
      :default_event_id,
      from: '',
      to: 'A default event to use for this user when editing. Not currently used.'
    )
  end
end
