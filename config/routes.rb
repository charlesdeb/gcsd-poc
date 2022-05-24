Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # home page is produced by showing the dynamic home page from the PagesController
  root controller: 'pages', action: 'show', slug: 'home'

  match ':slug', controller: 'pages', action: 'show', via: :get
end
