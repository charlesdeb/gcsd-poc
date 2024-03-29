require 'administrate/base_dashboard'

class TimeSlotDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,

    # Doesn't work at the moment;
    # event: Field::BelongsTo.with_options(
    #   searchable: true,
    #   searchable_fields: ['title']
    # ),

    event: Field::BelongsTo,
    title: Field::String,

    # Also doesn't work
    # starting_at: Field::DateTime.with_options(searchable: true),

    starting_at: Field::DateTime.with_options(format: '%a, %-d %b %Y %H:%M %Z'),
    finishing_at: Field::DateTime.with_options(format: '%a, %-d %b %Y %H:%M %Z'),
    sessions: Field::HasMany,
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
    event
    starting_at
    finishing_at
    sessions
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    event
    title
    starting_at
    finishing_at
    sessions
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    event
    title
    starting_at
    finishing_at
    sessions
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

  # Overwrite this method to customize how time slots are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(time_slot)
    "#{time_slot.starting_at.strftime('%a, %-d %b %Y %H:%M %Z')} (#{time_slot.title})"
  end
end
