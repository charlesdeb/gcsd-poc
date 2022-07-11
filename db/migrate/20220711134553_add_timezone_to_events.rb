# frozen_string_literal: true

class AddTimezoneToEvents < ActiveRecord::Migration[7.0]
  def change
    # we don't need to do this.
    # By default, Rails saves dates/times as UTC, and then converts back to
    # the local time zone
    # add_column :events, :time_zone, :string, null: false, default:
  end
end
