# frozen_string_literal: true

require 'administrate/base_dashboard'

class SessionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    description: RichTextAreaField.with_options(
      searchable: true
    ),
    requirements: RichTextAreaField.with_options(
      searchable: true
    ),
    presenter_bio_override: RichTextAreaField.with_options(
      searchable: true
    ),
    event: Field::BelongsTo,
    limit: Field::Number,
    featured_image: Field::ActiveStorage.with_options(
      index_preview_variant: :thumb,
      show_preview_variant: :thumb
    ),
    presenters: Field::HasMany,
    session_type: Field::BelongsTo,

    # Custom field which limits timeslots to the current event, but it is
    # not ready for use yet.
    # time_slots: TimeSlotsField,
    time_slots: Field::HasMany,

    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    title
    featured_image
    event
    time_slots
    session_type
    limit
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    event
    session_type
    featured_image
    presenters
    presenter_bio_override
    description
    requirements
    time_slots
    limit
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    event
    session_type
    title
    description
    requirements
    featured_image
    presenters
    presenter_bio_override
    time_slots
    limit
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how sessions are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(session)
    session.title
  end
end
