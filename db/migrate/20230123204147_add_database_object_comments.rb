class AddDatabaseObjectComments < ActiveRecord::Migration[7.0]
  def change
    # Events
    change_table_comment(:events, from: '', to: 'GCSD Events')
    change_column_comment(:events, :slug, from: '', to: 'unique, human readable name used in URL for event')
    change_column_comment(:events, :status, from: '', to: 'published, draft etc...')
    change_column_comment(:events, :starting_at, from: '', to: 'Time event starts')
    change_column_comment(:events, :finishing_at, from: '', to: 'Time event finishes')
    change_column_comment(:events, :is_featured, from: '', to: 'Is this event featured on the home page?')

    # Pages
    change_table_comment(:pages, from: '', to: 'Static pages')
    change_column_comment(:pages, :slug, from: '', to: 'unique, human readable name used in URL for page')

    # Presenters
    change_table_comment(:presenters, from: '', to: 'People that present sessions at a GCSD event')
    change_column_comment(:presenters, :name, from: '', to: 'Name of a presenter')

    # Presenters_Sessions
    change_table_comment(:presenters_sessions, from: '', to: 'Join table of Presenters that present Sessions')
    change_column_comment(:presenters_sessions, :session_id, from: '', to: 'Refers to a Session')
    change_column_comment(:presenters_sessions, :presenter_id, from: '', to: 'Refers to a Presenter')

    # Session_Types
    change_table_comment(:session_types, from: '', to: 'Lookup table of Session types')
    change_column_comment(:session_types, :order_by, from: '', to: 'Orders these types in dropdowns')

    # Sessions
    change_table_comment(:sessions, from: '', to: 'Sessions that take place during an Event')
    change_column_comment(:sessions, :limit, from: '',
                                             to: 'Maximum number of attenders for the session. Nil implies no limit')
    change_column_comment(:sessions, :event_id, from: '', to: 'Refers to the Event this Session is part of')
    change_column_comment(:sessions, :session_type_id, from: '', to: 'Refers to this Session\'s Session Type')
    change_column_comment(:sessions, :time_slot_id, from: '',
                                                    to: 'Refers to the Time Slot when this Session takes place')

    # Time Slots
    change_table_comment(:time_slots, from: '', to: 'Time Slots within an Event')
    change_column_comment(:time_slots, :event_id, from: '', to: 'Refers to the Event this Session is part of')
    change_column_comment(:time_slots, :starting_at, from: '', to: 'Time that the Time Slot starts')
    change_column_comment(:time_slots, :finishing_at, from: '', to: 'Time that the Time Slot finishes')

    # Users
    change_table_comment(:users, from: '', to: 'Users in the GCSD system. Managed by Devise')
    change_column_comment(:users, :first_name, from: '', to: 'First name of the User. Required if last_name null')
    change_column_comment(:users, :last_name, from: '', to: 'Last name of the User. Required if first_name null')
    change_column_comment(:users, :role, from: '', to: 'One of user, attender or admin')
    change_column_comment(:users, :time_zone, from: '', to: 'User\'s preferred time zone')
    change_column_comment(:users, :locale, from: '', to: 'User\'s preferred locale (i.e. language)')
  end
end
