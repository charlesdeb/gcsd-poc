# frozen_string_literal: true

require 'administrate/field/base'

# Code based on
# https://github.com/thoughtbot/administrate/blob/main/lib/administrate/field/has_many.rb
class TimeSlotsField < Administrate::Field::HasMany
  private

  # overridden only show time_slots for the same event as the session
  def candidate_resources
    current_event = resource.event
    where_clause = current_event ? { event_id: current_event.id } : {}

    if options.key?(:includes)
      includes = options.fetch(:includes)
      associated_class.includes(*includes).where(where_clause).all
    else
      associated_class.where(where_clause).all
    end
  end
end
