Rails.application.routes.draw do
  
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]

  
  root 'packages#index'
  devise_for :admins

  devise_for :users do
      resources :carts, only: [:show] do
        resources :cart_items, only: [:create, :update, :destroy] 
        get 'purchase_page' => 'cart_items#purchase_page'
        get 'purchase_check' => 'cart_items#purchase_check'
        get 'purchase_comfirmation' => 'cart_items#purchase_comfirmation'
      end
  end
  
        
    

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
