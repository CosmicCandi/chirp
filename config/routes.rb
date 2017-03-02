Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #User Endpoints
  post 'user/create' => 'users#create'

  #Chirp Endpoints

  #Follower Endpoints



end
