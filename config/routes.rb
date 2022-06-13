Rails.application.routes.draw do

  get '/sign_out', to: "sessions#destroy"
  get '/sign_in', to: "sessions#new"

  resource :session, only: [:create]
  resources :game_sessions

  root "pages#home"
end
