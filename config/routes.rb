Rails.application.routes.draw do

  
      devise_for :admins

      devise_for :users

  
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :packages, only: [:index, :show]
  resources :admin_packages

  
  resources :users, only: [:index, :edit, :update, :show, :destroy] do
      resources :carts, only: [:show] do
         resources :cart_items, only: [:create, :update, :destroy] 
         get 'purchase_page' => 'cart_items#purchase_page'
         get 'purchase_check' => 'cart_items#purchase_check'
         get 'purchase_confirmation' => 'cart_items#purchase_confirmation'
      end
  end
    
  

  
  root 'packages#index'
  

  
  
  
        
    


  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
