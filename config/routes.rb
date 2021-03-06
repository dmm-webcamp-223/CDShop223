Rails.application.routes.draw do

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :admin_users
    patch '/adimin_users/restore_user/:id' => 'admin_users#restore_user' ,as: 'admin_restore'

  resources :admin_packages
  resources :packages, only: [:index, :show] do
    resources :cart_items, only: [:create, :update]
    resources :reviews, only: [:create, :update, :edit, :destroy]
    resource :favorites, only: [:create, :destroy]
    post '/add_item' => 'carts#add_item'
    delete '/delete_item' => 'carts#delete_item'
  end

  resources :ship_data_logs, only: [:new, :create, :update, :index, :edit]


  resources :artists, only: [:new, :create, :update, :edit]
  resources :genres, only: [:new, :create, :update, :edit]
  resources :labels, only: [:new, :create, :update, :edit]

  resources :ship_adresses, only: [:create]


  resources :order_logs, only: [:index, :update, :show]

  resources :users, only: [:index, :edit, :update, :show, :destroy] do

     resources :carts, only: [:show, :create] do
       resources :recept_logs, only: [:create, :update]
       resource :purchase_pages, only: [:update, :destroy]
       resources :purchase_pages, only: [:show, :new, :create] do
             collection do
               get :purchase_check
               get :purchase_confirmation
            end
        end
     end
   end



 root 'packages#index'

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
