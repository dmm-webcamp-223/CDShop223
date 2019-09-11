class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
		if session[:cart_id]
			@cart = Cart.find(session[:cart_id])
		else
			@cart = Cart.configure_permitted_parameterssession[:cart_id] = @cart.cart_id
		end
	end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name_kanzi_sei, :name_kanzi_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :phone_number])
    end
end