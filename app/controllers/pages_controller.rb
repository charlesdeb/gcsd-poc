# frozen_string_literal: true

# public controller for pages
class PagesController < ApplicationController
  before_action :find_page

  def home
    # Get some events to show on the home page.
    # These are not related to the page resource at all, but since the home
    # page is a special case, this should be OK.
    @future_featured_event = Event.featured.future.published.first

    # We don't actually show a list of these on the home page; we just want to
    # know if they exist.
    @events = Event.published
  end

  def show; end

  private

  def find_page
    @page = Page.find_by(slug: params[:slug])
    render file: 'public/404.html', layout: false, status: 404 unless @page
  end
end
