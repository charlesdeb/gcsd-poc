# frozen_string_literal: true

# public controller for sessions
class SitemapController < ApplicationController
  def index
    # all Page records (should add a status field to this)
    @pages = Page.all

    # all Event records that the public can see
    @events = Event.publicly_viewable

    # all Session records with a timeslot in a publicly viewable Event
    # @sessions =
    #   Session.where(
    #     id: Session.select('sessions.id')
    #               .joins(:event)
    #               #  .where({'events.status': [:published, :coming_soon]})
    #               .merge(Event.publicly_viewable)
    #               .joins(:time_slots)
    #               .order('sessions.id ASC')
    #               .distinct)
    @sessions =
      Session.where(
        id: Session.select('sessions.id')
                   .joins(:event)
                   .where({ 'events.status': %i[published coming_soon] })
                   #  .merge(Event.publicly_viewable)
                   .joins(:time_slots)
                   #  .order('sessions.id ASC')
                   .distinct
      )
  end
end
