Rails.application.routes.draw do
  get 'screenshots/index'

  get '/sign_out', to: "sessions#destroy"
  get '/sign_in', to: "sessions#new"

  resource :session, only: [:create]
  resources :game_sessions

  root "game_sessions#index"
end
