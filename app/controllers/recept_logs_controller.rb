
class ReceptLogsController < ApplicationController
  def create
    
    @recept_log = ReceptLog.new(recept_params)
    @recept_log.user_id = current_user.id
    
    
    
    redirect_to purchase_check_user_cart_purchase_pages_path(current_user.id,current_cart.id)
    @recept_log.save!
    
  end
  


  
  private 
  def recept_params
    params.require(:recept_log).permit(:postal_code, :delivering_adddress)
  end
  
  

end