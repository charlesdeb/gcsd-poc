# frozen_string_literal: true

class Event < ApplicationRecord
  extend Mobility
  include ActiveModel::Serialization

  has_rich_text :description

  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  has_many :sessions
  has_many :time_slots

  translates :description, backend: :action_text
  translates :title, backend: :action_text, plain: true

  validates :title, :slug, :starting_at, :finishing_at, :status, :description, presence: true
  validates :slug, uniqueness: true

  validates :is_featured, inclusion: {
    in: [true, false],
    message: 'must be true or false'
  }

  validates :finishing_at, comparison: { greater_than: :starting_at, message: 'must be after the start date' }

  default_scope { i18n }
  scope :featured, -> { where(is_featured: true) }
  scope :future, -> { where('starting_at >= ?', Date.today) }
  scope :past, -> { where('finishing_at < ?', Date.today) }
  scope :published, -> { where(status: :published) }

  def session_types_with_counts
    session_ids = Event.find(id).sessions.ids

    # It is not possible to include the name in the query, since
    # they come from Mobility
    SessionType
      .select(:id, SessionType.arel_table[:id].count).group(:id)
      .joins(:sessions)
      .where(sessions: { id: session_ids })
      .order(:order_by)

    # While this works, it returns session objects, rather than session_type
    # which requires an extra call to session_type in order to grab the name.
    # The previous query is also easier to understand.
    #
    # sessions
    #   .joins(:session_type)
    #   .select(:session_type_id, SessionType.arel_table[:order_by], Session.arel_table[:session_type_id].count)
    #   .group(:session_type_id, SessionType.arel_table[:order_by])
    #   .order(SessionType.arel_table[:order_by])
  end
end
