Rails.application.routes.draw do

  post '/games', to: 'games#create', as: 'new_game'
  post '/start_game', to: 'games#start', as: 'start_game'
end
