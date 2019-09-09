Rails.application.routes.draw do
  devise_for :admins

  devise_for :users

  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :packages

  
  root 'packages#index'


  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
