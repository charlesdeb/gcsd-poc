# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale:
  /#{I18n.available_locales.join("|")}/ do
    # home page is produced by running the home action of the PagesController
    # with its own (home) template as the slug
    # root controller: 'pages', action: 'home', slug: 'home', locale: I18n.default_locale
    root controller: 'pages', action: 'home', slug: 'home'

    # Add a mobility locale to the admin area for translating content
    scope '(:mobility_locale)', mobility_locale:
    /#{I18n.available_locales.join("|")}/ do
      namespace :admin do
        resources :users
        resources :events
        resources :pages
        resources :sessions
        resources :session_types
        resources :time_slots
        resources :presenters

        root to: 'events#index'
      end
    end

    devise_for :users

    # TODO: not sure if we really want to default this
    defaults locale: I18n.locale do
      resources :events, only: %i[index show]
    end

    # namespace :admin do
    #   resources :events
    # end

    ####
    # Custom routes start here
    #
    # For each new custom route:
    #
    # * Be sure you have the canonical route declared above
    # * Add the new custom route below the existing ones
    # * Document why it's needed
    # * Explain anything else non-standard

    # shortcut route for past and future events
    get '/future_events', action: :index, controller: 'events', scope: 'future'
    get '/past_events', action: :index, controller: 'events', scope: 'past'

    # catch all route to catch pages in the CMS which could have any slug name
    # Is this a security risk?
    match '*slug', controller: 'pages', action: 'show', via: :get, as: 'page', constraints: lambda { |request|
      !request.path_parameters[:slug].start_with?('rails/')
    }
  end
end
