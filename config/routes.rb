Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  root 'prototypes#index'

  get   '/prototypes/index' =>    'prototypes#index'
  get   '/prototypes/new'   =>    'prototypes#new'
  get   '/prototypes/show'  =>    'prototypes#show'
  get   '/users/:id'        =>    'users#show'
  get   '/users/:id/edit'   =>    'users#edit'
  patch '/users/:id'        =>    'users#update'

end
