class PackagesController < ApplicationController
  def index
    @packages = Package.page(params[:page]).reverse_order.search(params[:search])
  end

  def show
  	@package = Package.find(params[:id])
    @package.price = @package.price + @package.price * 0.08
    @discs = @package.discs.all
  end

  def create
    cart.user_id = current_user.id
    @cart = Cart.new(cart_params)
    if @cart.save!
      redirect_to user_cart_path
    else
      render :show
    end
  end

  private
  def cart_params
      params.require(:cart).permit(:user_id)
  end
end
