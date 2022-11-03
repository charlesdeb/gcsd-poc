# frozen_string_literal: true

# public controller for pages
class PagesController < ApplicationController
  before_action :find_page

  def home
    # get a future event to show on the home page - if there is one
    @future_event = Event.featured.future.published.first
    @future_events = Event.future.published
    @past_events = Event.past.published
  end

  def show; end

  private

  def find_page
    @page = Page.find_by(slug: params[:slug])
    render file: 'public/404.html', layout: false, status: 404 unless @page
  end
end
