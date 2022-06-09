Rails.application.routes.draw do

  resource :session
  resources :games

  root "pages#home"
end
