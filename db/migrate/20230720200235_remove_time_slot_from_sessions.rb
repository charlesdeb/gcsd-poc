class RemoveTimeSlotFromSessions < ActiveRecord::Migration[7.0]
  def up
    change_column_comment(
      :sessions,
      :time_slot_id,
      from: 'Refers to the Time Slot when this Session takes place',
      to: ''
    )

    remove_column :sessions, :time_slot_id, null: true, foreign_key: true
  end

  def down
    add_reference :sessions, :time_slot, null: true, foreign_key: true

    # and now undo the default
    change_column_default(:sessions, :time_slot_id, nil)

    # populate the column with the first time_slot in the many-many table
    Session.all.each do |session|
      if session.time_slots.count > 0

        first_session_id = session.time_slots.first.id
        session.time_slot_id = first_session_id

      else
        session.time_slot_id = nil
      end
      session.save!
    end

    change_column_comment(
      :sessions,
      :time_slot_id,
      from: '',
      to: 'Refers to the Time Slot when this Session takes place'
    )
  end
end
