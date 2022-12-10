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
        resources :session_types

        root to: 'events#index'
      end
    end

    devise_for :users

    # TODO: not sure if we really want this...
    defaults locale: I18n.locale do
      resources :events, only: %i[index show] do
        get 'future', on: :collection
        get 'past', on: :collection
      end
    end

    # namespace :admin do
    #   resources :events
    # end

    # catch all route to catch any page - this could be a security risk...
    match '*slug', controller: 'pages', action: 'show', via: :get, as: 'page', constraints: lambda { |request|
      !request.path_parameters[:slug].start_with?('rails/')
    }
  end
end
