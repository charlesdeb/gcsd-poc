# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page = Page.find_by(slug: params[:slug])

    # redirect_to root_url, flash: { error: 'Record not found.' } unless @page
    # render '/public/404.html', flash: { error: 'Record not found.' } unless @page
    # raise ActionController::RoutingError, 'Page Not Found' unless @page
    # render file: '/public/404', status: 404, formats: [:html] unless @page
    # render file: "#{RAILS_ROOT}/public/404.html", layout: false, status: 404 unless @page
    render file: 'public/404.html', layout: false, status: 404 unless @page
  end
end
