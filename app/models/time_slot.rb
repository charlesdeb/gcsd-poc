# frozen_string_literal: true

# Each Event has a number of time_slots that sessions can scheduled for
class TimeSlot < ApplicationRecord
  extend Mobility

  belongs_to :event

  # has_many :sessions
  has_and_belongs_to_many :sessions

  translates :title, backend: :action_text, plain: true

  # TODO: this same validation is used for events as well; refactor it
  validates :finishing_at, comparison: { greater_than: :starting_at, message: 'must be after the start date' }
  validates :title, :event_id, :starting_at, :finishing_at, presence: true
  validates :title, uniqueness: { scope: :event_id, message: 'has already been defined for this event' }
  validates :starting_at, uniqueness: { scope: :event_id, message: 'has already been defined for this event' }
end
