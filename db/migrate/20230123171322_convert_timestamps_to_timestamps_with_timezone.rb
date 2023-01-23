class ConvertTimestampsToTimestampsWithTimezone < ActiveRecord::Migration[7.0]
  def up
    timestamp_format = 'timestamp(6) with time zone'
    change_column :events, :starting_at, timestamp_format
    change_column :events, :finishing_at, timestamp_format
    change_column :events, :created_at, timestamp_format, :null => false
    change_column :events, :updated_at, timestamp_format, :null => false

    change_column :pages, :created_at, timestamp_format, :null => false
    change_column :pages, :updated_at, timestamp_format, :null => false

    change_column :presenters, :created_at, timestamp_format, :null => false
    change_column :presenters, :updated_at, timestamp_format, :null => false

    change_column :session_types, :created_at, timestamp_format, :null => false
    change_column :session_types, :updated_at, timestamp_format, :null => false

    change_column :sessions, :created_at, timestamp_format, :null => false
    change_column :sessions, :updated_at, timestamp_format, :null => false

    change_column :time_slots, :starting_at, timestamp_format
    change_column :time_slots, :finishing_at, timestamp_format
    change_column :time_slots, :created_at, timestamp_format, :null => false
    change_column :time_slots, :updated_at, timestamp_format, :null => false
  end

  def down
    timestamp_format = 'timestamp(6) without time zone'
    change_column :events, :starting_at, timestamp_format
    change_column :events, :finishing_at, timestamp_format
    change_column :events, :created_at, timestamp_format, :null => false
    change_column :events, :updated_at, timestamp_format, :null => false

    change_column :pages, :created_at, timestamp_format, :null => false
    change_column :pages, :updated_at, timestamp_format, :null => false

    change_column :presenters, :created_at, timestamp_format, :null => false
    change_column :presenters, :updated_at, timestamp_format, :null => false

    change_column :session_types, :created_at, timestamp_format, :null => false
    change_column :session_types, :updated_at, timestamp_format, :null => false

    change_column :sessions, :created_at, timestamp_format, :null => false
    change_column :sessions, :updated_at, timestamp_format, :null => false

    change_column :time_slots, :starting_at, timestamp_format
    change_column :time_slots, :finishing_at, timestamp_format
    change_column :time_slots, :created_at, timestamp_format, :null => false
    change_column :time_slots, :updated_at, timestamp_format, :null => false
  end
end
