Rails.application.routes.draw do
  devise_for :users
  resources :friends_tables
  get 'home/index'
  get 'home/about'
  root 'home#index'
  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
  resources :messages, only: [:create]
end
