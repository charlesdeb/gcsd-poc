# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  scope '(:locale)', locale: # rubocop:disable Metrics/BlockLength
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

    # Don't run devise if we're pre-compiling, because database.yml doesn't
    # exist, the devise_for assumes its existence
    unless Rake.respond_to?(:application) && (Rake.application.top_level_tasks.include? 'assets:precompile')
      devise_for :users
    end

    resources :events, only: %i[index show]
    resources :sessions, only: %i[show]
    resources :contact_form, only: %i[new create]

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

    # routes for showing sub-sets of sessions
    # get '/sessions', to: redirect('/')
    get '/sessions/by_time_slot/:time_slot', to: 'sessions#index', as: :sessions_by_time_slot
    get '/sessions/by_event/:event/by_type/:session_type', to: 'sessions#index', as: :sessions_by_event_and_type

    # catch all route to catch pages in the CMS which could have any slug name
    # Is this a security risk?
    match '*slug', controller: 'pages', action: 'show', via: :get, as: 'page', constraints: lambda { |request|
      !request.path_parameters[:slug].start_with?('rails/')
    }
  end
end
