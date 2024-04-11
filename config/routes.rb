Rails.application.routes.draw do
  get '/callback', to: 'callback#index'
  get '/login', to: 'login#index'
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
