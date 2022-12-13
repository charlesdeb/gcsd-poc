# frozen_string_literal: true

class Session < ApplicationRecord
  extend Mobility

  validates :title, :description, :event_id, :session_type_id, presence: true

  has_rich_text :description

  translates :description, backend: :action_text
  translates :title, backend: :action_text, plain: true

  belongs_to :event
  belongs_to :session_type
  belongs_to :time_slot

  default_scope { i18n }
end
