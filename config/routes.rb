Rails.application.routes.draw do

  get 'cart_items/create'
  get 'cart_items/purchase_page'
  get 'cart_items/purchase_check'
  get 'cart_items/purchase_comfamation'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'songs/destroy'
  get 'users/edit'
  get 'users/index'
  get 'users/update'
  get 'users/destroy'
  get 'users/show'
  get 'users/admin_show'
  get 'users/admin_edit'
  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }

  devise_scope :admin do
    get "sign_in", :to => "admins/sessions#new"
    get "sign_out", :to => "admins/sessions#destroy"
  end



  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }

  devise_scope :user do
  	get "sign_in", :to => "users/sessions#new"
  	get "sign_out", :to => "users/sessions#destroy"
  end
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
