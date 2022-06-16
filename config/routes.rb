Rails.application.routes.draw do
  get 'screenshots/index'

  get '/sign_out', to: "sessions#destroy"
  get '/sign_in', to: "sessions#new"
  get '/sessions/new', to: "sessions#new"

  resource :session, only: [:create]
  resources :game_sessions do
    member do
      post 'start'
      get 'staging'
    end
  end

  root "game_sessions#index"
end
