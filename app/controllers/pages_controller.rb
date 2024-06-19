# frozen_string_literal: true

# public controller for pages
class PagesController < ApplicationController
  before_action :find_page

  def home
    # Get some events to show on the home page.
    # These are not related to the page resource at all, but since the home
    # page is a special case, this should be OK.
    @future_featured_event = Event.featured.future.publicly_viewable.first

    # We don't actually show a list of these on the home page; we just want to
    # know if they exist.
    @events = Event.publicly_viewable

    update_active_menu_item(:home)
  end

  def show; end

  private

  def find_page
    @page = Page.find_by(slug: params[:slug])
    update_active_menu_item(params[:slug]) if @page
    return if @page

    # trigger page not found error
    redirect_to controller: 'errors', action: :not_found
  end
end
