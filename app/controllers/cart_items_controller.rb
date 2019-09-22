class CartItemsController < ApplicationController
  def create
    @ship_address = ShipAdress.new(shipaddress_params)
  end

  def purchase_comfirmation
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update
    item = CartItem.find(params[:id])
    item.update!(cart_item_params)
     redirect_to user_cart_path(current_user.id,current_cart.id)
  end

  def destroy
  end


  private
    def shipaddress_params
      params.require(:ship_adress).permit(:posal_code, :shipping_add)
    end

    def cart_item_params
      params.require(:cart_item).permit(:package_id, :quantity)
    end

end
