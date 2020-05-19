Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  namespace :posts do
    resources :searches, only: :index
  end
  resources :posts do
    resources :kuchikomis, only: :create
  end
  resources :users, only: :show
end
