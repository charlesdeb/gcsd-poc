# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # home page is produced by running the home action of the PagesController
  # with its own template
  root controller: 'pages', action: 'home', slug: 'home'

  # resources :events
  resources :events, only: %i[index show]

  namespace :admin do
    resources :events
  end

  # catch all route to catch any page - this could be a security risk...
  match '*slug', controller: 'pages', action: 'show', via: :get, as: 'page'
end
