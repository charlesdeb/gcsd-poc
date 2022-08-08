# frozen_string_literal: true

Rails.application.routes.draw do
  # home page is produced by running the home action of the PagesController
  # with its own (home) template as the slug
  root controller: 'pages', action: 'home', slug: 'home'

  namespace :admin do
    resources :users
    resources :events
    resources :pages

    root to: 'events#index'
  end

  devise_for :users

  resources :events, only: %i[index show] do
    get 'future', on: :collection
  end

  # namespace :admin do
  #   resources :events
  # end

  # catch all route to catch any page - this could be a security risk...
  match '*slug', controller: 'pages', action: 'show', via: :get, as: 'page', constraints: lambda { |request|
                                                                                            !request.path_parameters[:slug].start_with?('rails/')
                                                                                          }
end
