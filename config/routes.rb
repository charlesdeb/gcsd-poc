# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :events
    resources :pages

    root to: 'events#index'
  end

  scope '(:locale)', locale:
  /#{I18n.available_locales.join("|")}/ do
    # home page is produced by running the home action of the PagesController
    # with its own (home) template as the slug
    root controller: 'pages', action: 'home', slug: 'home'

    devise_for :users

    resources :events, only: %i[index show] do
      get 'future', on: :collection
      get 'past', on: :collection
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
