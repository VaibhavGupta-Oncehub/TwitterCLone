Rails.application.routes.draw do
  root 'home#home'

  get'/helpdesk', to: 'home#help_desk'

  devise_for :users 
  
  resources :users, :only => [:show,:index]
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  
  resources :tweets
  
  resources :follows





end
