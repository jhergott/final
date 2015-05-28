Rails.application.routes.draw do

  root 'balls#index'

  get "/signup" => 'users#new'
  post "/users" => 'users#create'

  get "/login" => 'sessions#new'
  post "/sessions" => 'sessions#create'
  delete "/logout" => 'sessions#destroy'

  resources :balls
  resources :drivers
  resources :irons
  resources :pros

  resources :password_resets
  
end
