Rails.application.routes.draw do
  root 'prototypes/popular#index#index'

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  scope module: :prototypes do
    resources :popular, :newest, only: :index
  end
end
