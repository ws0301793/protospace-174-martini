Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  resources :users, only: [:show]
  resources :prototypes, only: [:index, :new, :create, :show,:edit,:update]
  resources :prototypes do
    resources :comments, only: [:create, :destroy]
  end
  
end
