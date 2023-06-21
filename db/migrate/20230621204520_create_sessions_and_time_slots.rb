class CreateSessionsAndTimeSlots < ActiveRecord::Migration[7.0]
  def change
    create_join_table :sessions, :time_slots do |t|
      t.index :session_id
      t.index :time_slot_id
    end

    change_column_comment(
      :sessions_time_slots,
      :session_id,
      from: '',
      to: 'A session'
    )

    change_column_comment(
      :sessions_time_slots,
      :time_slot_id,
      from: '',
      to: 'A time slot for the session'
    )

    add_index :sessions_time_slots, %i[session_id time_slot_id], unique: true

    # migrate data into join table
    Session.all.each { |s| SessionsTimeSlot.create(session_id: s.id, time_slot_id: s.time_slot_id) unless s.time_slot.blank? }
  end
end
