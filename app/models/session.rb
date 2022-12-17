# frozen_string_literal: true

class Session < ApplicationRecord
  extend Mobility

  validates :title, :description, :event_id, :session_type_id, presence: true

  has_rich_text :description
  has_rich_text :requirements

  translates :title, backend: :action_text, plain: true
  translates :description, backend: :action_text
  translates :requirements, backend: :action_text

  belongs_to :event
  belongs_to :session_type

  # we may want to create a session before knowing when it is scheduled
  belongs_to :time_slot, optional: true

  default_scope { i18n }
end
