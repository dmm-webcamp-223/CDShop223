class PackagesController < ApplicationController
  def index
    @packages = Package.page(params[:page]).reverse_order
  end

  def show
  	@package = Package.find(params[:id])
    @discs = Disc.all.includes(:songs)
    @artists = Artist.all.includes(:songs)
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




