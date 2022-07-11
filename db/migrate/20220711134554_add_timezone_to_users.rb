# frozen_string_literal: true

class AddTimezoneToUsers < ActiveRecord::Migration[7.0]
  def change
    # By default, Rails saves dates/times as UTC, and then converts back to
    # the local time zone, but it's good to know what timezone the user is
    # interested in so that we can show times in the user's preferred timezone.
    add_column :users, :time_zone, :string, null: false, default: 'London'
  end
end
