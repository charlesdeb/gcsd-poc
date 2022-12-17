class AddIndexesToTimeSlot < ActiveRecord::Migration[7.0]
  def change
    add_index :time_slots, %i[event_id starting_at], unique: true

    remove_index :time_slots, %i[starting_at]
  end
end
