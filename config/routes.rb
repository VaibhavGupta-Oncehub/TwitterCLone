Rails.application.routes.draw do
  root 'home#home'

  devise_for :users 

  resources :users, :only => [:show]
  resources :tweets




end
