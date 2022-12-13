# frozen_string_literal: true

# Each Event has a number of time_slots that sessions can scheduled for
class TimeSlot < ApplicationRecord
  belongs_to :event

  has_many :sessions

  # TODO: this same validation is used for events as well; refactor it
  validates :finishing_at, comparison: { greater_than: :starting_at, message: 'must be after the start date' }
end
