# frozen_string_literal: true

# public controller for pages
class PagesController < ApplicationController
  before_action :find_page

  def home
    # get a future event to show on the home page - if there is one
    # @event = Event.featured.future.published.first
    @future_event = Event.featured.future.published.first
  end

  def show; end

  private

  def find_page
    @page = Page.find_by(slug: params[:slug])

    # redirect_to root_url, flash: { error: 'Record not found.' } unless @page
    # render '/public/404.html', flash: { error: 'Record not found.' } unless @page
    # raise ActionController::RoutingError, 'Page Not Found' unless @page
    # render file: '/public/404', status: 404, formats: [:html] unless @page
    # render file: "#{RAILS_ROOT}/public/404.html", layout: false, status: 404 unless @page
    render file: 'public/404.html', layout: false, status: 404 unless @page
  end
end
