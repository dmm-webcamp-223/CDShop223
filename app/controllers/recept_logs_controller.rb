
class ReceptLogsController < ApplicationController
  def create
    
      @recept_log = ReceptLog.new(recept_params)
      @recept_log.user_id = current_user.id
      
      @cart_items = CartItem.where(cart_id: params[:cart_id])
      
        
            @recept_log.total = @cart_items.sum(:total_cost)*1.08
            @recept_log.postage=500
      
          @recept_log.save!
          @cart_items.each do |f|
            @purchase_data_log =PurchaseDataLog.new()
            @purchase_data_log.package_id = f.package.id
            @purchase_data_log.recept_log_id = current_user.id
            @purchase_data_log.purchase_price = f.package.price
            @purchase_data_log.tax = (f.package.price*0.08)
            @purchase_data_log.numbers=f.quantity
            @purchase_data_log.save!
          end
          
            
          redirect_to purchase_check_user_cart_purchase_pages_path(current_user.id,current_cart.id)
      
        
  end
    


  
  private 
  def recept_params
    params.require(:recept_log).permit(:postal_code, :delivering_adddress)
  end
  
  

end