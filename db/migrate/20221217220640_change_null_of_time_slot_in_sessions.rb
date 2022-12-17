class ChangeNullOfTimeSlotInSessions < ActiveRecord::Migration[7.0]
  def up
    change_column_null :sessions, :time_slot_id, true
  end

  def down
    change_column_null :sessions, :time_slot_id, false
  end
end
