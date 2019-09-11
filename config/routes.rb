Rails.application.routes.draw do

  
      devise_for :admins

      devise_for :users

  
resources :packages, only: [:index, :show] do
  resources :cart_items, only: [:create, :update, :destroy]
    post '/add_item' => 'carts#add_item'
    post '/update_item' => 'carts#update_item'
    delete '/delete_item' => 'carts#delete_item'
end



  resources :admin_packages

  
  resources :artists, only: [:new, :create, :destroy]
  resources :labels, only: [:new, :create, :destroy]
  resources :genres, only: [:new, :create, :destroy]
  
  
  
  

  
  resources :users, only: [:index, :edit, :update, :show, :destroy] 
      resources :carts, only: [:show] 
         get 'purchase_page' => 'cart_items#purchase_page'
         get 'purchase_check' => 'cart_items#purchase_check'
         get 'purchase_confirmation' => 'cart_items#purchase_confirmation'

  
    
  

  
  root 'packages#index'
  

  
  
  
        
    


  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
