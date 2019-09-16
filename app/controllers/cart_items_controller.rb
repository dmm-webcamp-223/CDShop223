class CartItemsController < ApplicationController
  def create
    @ship_address = ShipAdress.new(shipaddress_params)
  end

  def purchase_comfirmation
  end

  def update
  end

  def destroy
  end
  
  
  private
    def shipaddress_params
      params.require(:ship_adress).permit(:posal_code, :shipping_add)
    end
end
