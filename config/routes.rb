Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new,:create, :edit, :update, :destroy] do
    member do 
      get :followings
      get :followers
      get :likes
    end
    collection do
      get :search
    end
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :phrases, only: [:create, :destroy, :edit]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
