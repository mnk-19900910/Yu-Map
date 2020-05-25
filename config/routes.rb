Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :kuchikomis, only: :create
    
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :tags

end
