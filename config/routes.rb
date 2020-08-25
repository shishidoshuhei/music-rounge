Rails.application.routes.draw do
  get 'users/show'
  root to: 'posts#index'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
