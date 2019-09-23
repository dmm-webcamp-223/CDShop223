class PackagesController < ApplicationController

  def index
  #売れた個数ランキング処理
    purchasedata = PurchaseDataLog.week
    package = Package.all
    package.each do |f|
      f.week = purchasedata.where(package_id: f.id).sum(:numbers)
      f.save
    end


    @packages_week = Package.order('week DESC').limit(4)
  #ここまで

    @packages = Package.page(params[:page]).reverse_order.search(params[:search])
    

   # @purchase_numbers=@purchasedata.group(:package_id).sum(:numbers)


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
