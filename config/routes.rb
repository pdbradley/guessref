Rails.application.routes.draw do
  get 'screenshots/index'

  get '/sign_out', to: "sessions#destroy"
  get '/sign_in', to: "sessions#new", as: :sign_in
  get '/sessions/new', to: "sessions#new"

  get '/about', to: 'pages#about', as: :about

  resource :session, only: [:create]
  resources :game_sessions do
    member do
      post 'start'
      post 'reset'
      get 'staging'
    end
  end

  get '/verse_answers/:id', to: "verse_answers#show", as: :verse_answer

  resources :chats, only: [:new, :create, :show]

  resources :book_guesses, only: [:create]
  resources :chapter_guesses, only: [:create]
  resources :verse_guesses, only: [:create]

  resources :user_game_sessions, only: [:create, :destroy]

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  root "game_sessions#index"
end
