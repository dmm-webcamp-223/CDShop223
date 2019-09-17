#使わないかも
class PurchaseDataLogsController < ApplicationController
  def create
      @cart_items = CartItem.where(user_id: params[:user_id])
      @purchase_data_log = PurchaseDataLog.new(purchase_params)
      
          @purchase_data_log.purchase_price=@cart_items.package.price
          @purchase_data_log.tax=@cart_items.package.price*0.08
          @purchase_data_log.numbers=@cart_items.quantity
    
      if @purchase_data_log.save!
         redirect_to purchase_check_user_cart_purchase_pages_path(current_user.id,current_cart.id)
      else
         redirect_to user_cart_purchase_page_path(current_user.id, current_cart.id)
      end
      
  end
  
  
  
  private
  
  def purchase_params
      params.require(:purchase_data_log).permit(:purchase_price,:tax,:numbers)
  end
  
end
