Rails.application.routes.draw do
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #User Endpoints
  get 'users' => 'users#index'
  post 'create' => 'users#create'
  post 'login' => 'sessions#login'

  #Chirp Endpoints
  get 'chirps' => 'posts#index'
  post 'chirps/create' => 'posts#create'




  #Follower Endpoints



end
