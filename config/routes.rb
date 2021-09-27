Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new,:create, :edit, :destroy] do
    member do 
      get :followings
      get :followers
    end
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :phrases, only: [:create, :destroy, :edit]
  resources :relationships, only: [:create, :destroy]
end
