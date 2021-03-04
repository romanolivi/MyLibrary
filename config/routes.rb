Rails.application.routes.draw do
  resources :reviews
  resources :books
  resources :users

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  post 'logout' => 'sessions#destroy'
 
end
