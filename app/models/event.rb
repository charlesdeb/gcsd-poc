# frozen_string_literal: true

# an event
class Event < ApplicationRecord
  extend Mobility
  extend FriendlyId
  include ActiveModel::Serialization

  # draft:       not shown on the website at all
  # coming_soon: only main event info is shown - no details. Surfer cannot
  #              register
  # published:   full event details are shown. Surfer can register (if there is
  #              EventBrite information
  # archived:    Not shown on the website at all TODO: do we need this?
  enum :status, { draft: 0, coming_soon: 1, published: 2, archived: 3 }

  has_rich_text :description

  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  has_many :sessions
  has_many :time_slots

  # fallbacks don't work on rich text
  translates :description, backend: :action_text
  translates :title, backend: :action_text, plain: true, fallbacks: { fr: :en }

  validates :title, :slug, :starting_at, :finishing_at, :status, :description, presence: true

  validates :slug, uniqueness: true

  validates :is_featured, inclusion: {
    in: [true, false],
    message: 'must be true or false'
  }

  validates :finishing_at, comparison: { greater_than: :starting_at, message: 'must be after the start date' }

  validates :registration_url, url: true

  validate :registration_url_required_to_publish

  friendly_id :title, use: :slugged

  default_scope { i18n }
  scope :featured, -> { where(is_featured: true) }
  scope :future, -> { where('starting_at >= ?', Date.today) }
  scope :past, -> { where('finishing_at < ?', Date.today) }
  scope :publicly_viewable, lambda {
                              order(starting_at: :desc)
                                .published.or(coming_soon)
                                # a hack hiding that hides events
                                # .where.not(title: nil)
                                .with_attached_featured_image
                                .includes(%i[plain_text_translations rich_text_description])
                            }

  def session_types_with_counts
    session_ids = Event.find(id).sessions.ids

    # It is not possible to include the name in the query, since
    # they come from Mobility
    SessionType
      .select(:id, SessionType.arel_table[:id].count).group(:id)
      .joins(:sessions)
      .where(sessions: { id: session_ids })
      .order(:order_by)
      .includes([:plain_text_translations])

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

  # surfers can only register for published, future events
  def registerable?
    published? && future?
  end

  # surfers can only see events that are published (with full session info)
  # or those that are coming soon with partial/missing session info
  def publicly_viewable?
    published? || coming_soon?
  end

  def future?
    starting_at >= DateTime.now
  end

  def registration_url_required_to_publish
    return unless published? && registration_url.blank?

    errors.add :base, :invalid,
               message: 'Event cannot be published without registration_url'
  end
end
