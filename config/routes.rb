Rails.application.routes.draw do

  root 'application#home'

  resources :users do 
    resources :reviews, only: [:show, :edit, :new, :index, :create]
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

  get '/auth/:provider/callback' => 'sessions#create'

  
 
end
