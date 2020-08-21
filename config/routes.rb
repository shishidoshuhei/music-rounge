Rails.application.routes.draw do
  get 'users/show'
  root to: 'posts#index'
  resources :posts
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
