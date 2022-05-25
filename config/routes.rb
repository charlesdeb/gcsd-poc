# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # home page is produced by running the home action of the PagesController 
  # with its own template
  root controller: 'pages', action: 'home', slug: 'home'

  # catch all route to catch any page - this could be a security risk...
  match '*slug', controller: 'pages', action: 'show', via: :get, as: 'page'
end
