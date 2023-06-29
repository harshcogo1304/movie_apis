Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'movies#index'
  get 'movies/search', to: 'movies#search'
  post 'movies/:id/add_to_favorites', to: 'movies#add_to_favorites', as: 'add_to_favorites'
  get 'favorites', to: 'movies#favorites'
end
