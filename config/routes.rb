Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/games', to: 'games#create', as: 'new_game'
  post '/start_game', to: 'games#start', as: 'start_game'

  resource :session

end
