Rails.application.routes.draw do
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #User Endpoints
  get 'users' => 'users#index'
  post 'create' => 'users#create'
  post 'login' => 'sessions#login'
  post 'users/follow/:username' => 'users#follow'
  post 'users/unfollow/:username' => 'users#unfollow'
  post 'users/logout' => 'sessions#signout'

  #Chirp Endpoints
  get 'chirps' => 'posts#index'
  post 'chirps/create' => 'posts#create'
  get 'chirps/timeline' => 'posts#timeline'
  get 'chirps/paginate/:page' => 'posts#paginate'
  #Follower Endpoints

end
