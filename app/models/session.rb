# frozen_string_literal: true

# an individual session with a GCSD event
class Session < ApplicationRecord
  extend Mobility

  has_rich_text :description
  has_rich_text :requirements
  has_rich_text :presenter_bio_override

  # using has_many_attached is not very well supported with the
  # administrate-field-active_storage gem, so for now, we"re only going to
  # allow one image per session.
  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  translates :title, backend: :action_text, plain: true
  translates :description, backend: :action_text
  translates :requirements, backend: :action_text
  translates :presenter_bio_override, backend: :action_text

  belongs_to :event
  belongs_to :session_type
  has_and_belongs_to_many :presenters
  has_and_belongs_to_many :time_slots

  validates :title, :description, :event_id, :session_type_id, presence: true

  validate :time_slots_must_be_for_sessions_event

  I18n.available_locales.each do |locale|
    validates :"title_#{locale}", mobility_session_uniqueness: true
  end

  default_scope { i18n }

  private

  def time_slots_must_be_for_sessions_event
    time_slots.each do |time_slot|
      if time_slot.event_id != event_id
        errors.add :base, :invalid,
                   message: "Time Slot '#{time_slot.title}' is not for event '#{event.title}'"
      end
    end
  end
end
