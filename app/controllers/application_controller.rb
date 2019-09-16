class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  
  #カートの作成 
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    if Cart.find_by(user_id: current_user.id)
      @cart = Cart.find_by(user_id: current_user.id)
    else
      @cart = Cart.create(user_id: current_user.id)
    end
  end

  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name_kanzi_sei, :name_kanzi_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :phone_number])
    end
end