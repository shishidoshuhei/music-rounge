Rails.application.routes.draw do
  get 'users/show'
  get 'home/about' => "home/about"
  root to: 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :tags, only: [:show]
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
