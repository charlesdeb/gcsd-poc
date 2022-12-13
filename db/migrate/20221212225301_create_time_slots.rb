class CreateTimeSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :time_slots do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :starting_at, null: false
      t.datetime :finishing_at, null: false

      t.timestamps
    end

    add_index :time_slots, :starting_at
  end
end
