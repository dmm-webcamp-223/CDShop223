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
  resources :admin_packages
  resources :packages, only: [:index, :show] do
    resources :cart_items, only: [:create, :update, :destroy]
    post '/add_item' => 'carts#add_item'
    post '/update_item' => 'carts#update_item'
    delete '/delete_item' => 'carts#delete_item'
  end

  resources :ship_data_logs, only: [:new, :create, :update, :index, :edit]

  resources :artists, only: [:new, :create, :destroy]
  resources :labels, only: [:new, :create, :destroy]
  resources :genres, only: [:new, :create, :destroy]


  resources :ship_adresses, only: [:create]

  resources :users, only: [:index, :edit, :update, :show, :destroy] do
   resources :carts, only: [:show, :create] do
     resources :recept_logs, only: [:create]
     resource :purchase_pages, only: [:update]
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

