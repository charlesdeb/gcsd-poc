class AddTimeSlotToSession < ActiveRecord::Migration[7.0]
  def change
    add_reference :sessions, :time_slot, null: false, foreign_key: true, default: 1

    # and now undo the default
    change_column_default(:sessions, :time_slot_id, nil)
  end
end
