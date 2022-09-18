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
      get 'staging'
    end
  end

  get '/verse_answers/:id', to: "verse_answers#show", as: :verse_answer
  
  post '/handle_book_name_guess', to: "verse_answers#handle_book_guess", as: :handle_book_guess
  post '/handle_verse_number_guess', to: "verse_answers#handle_verse_guess", as: :handle_verse_guess
  post '/handle_chapter_number_guess', to: "verse_answers#handle_chapter_guess", as: :handle_chapter_guess

  resources :chats, only: [:new, :create, :show]

  resources :user_game_sessions, only: [:create, :destroy]

  root "game_sessions#index"
end
