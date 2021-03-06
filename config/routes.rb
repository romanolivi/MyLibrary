Rails.application.routes.draw do

  root 'application#home'

  resources :users, only: [:new, :create, :edit, :update, :destroy, :show] do 
    resources :reviews, only: [:show, :edit, :new, :index]
  end

  resources :books do 
    resources :reviews, only: [:show, :edit, :new, :index, :create, :update]
  end

  resources :reviews

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get '/auth/facebook' => 'sessions#facebook'
 
end
