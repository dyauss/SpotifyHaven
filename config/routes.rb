Rails.application.routes.draw do
  devise_for :users
  get '/refresh_token', to: 'token#refresh'
  get '/playlists', to: 'playlist#index'
  get '/about', to: 'about#index'
  get '/obsessions', to: 'obsession#index'
  get '/callback', to: 'callback#index'
  get '/login', to: 'login#index'
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
