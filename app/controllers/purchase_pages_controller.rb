class PurchasePagesController < ApplicationController
  def show
      @user=User.find(params[:user_id])
      @ship_address=ShipAdress.where(user_id: params[:user_id])
      @cart_items = CartItem.where(cart_id: params[:cart_id])
      @recept_log = ReceptLog.new
  end
  
  def purchase_check
    @user=User.find(params[:user_id])
    @cart_items=CartItem.where(cart_id: params[:cart_id])
    @ship_address=ShipAdress.where(user_id: params[:user_id])
    @recept_log = ReceptLog.order('id DESC').find_by(user_id: params[:user_id])
  end
  
  def new
     @ship_address=ShipAdress.new
  end
  
    def create
    @ship_address=ShipAdress.new(ship_add_params)
    @ship_address.user_id = current_user.id
    if @ship_address.save!
      redirect_to user_cart_purchase_page_path(current_user.id, current_cart.id, current_user.id)
    else
      render :new
    end
  end
  
   def update
     @cart_items = CartItem.where(cart_id: params[:cart_id])
     @recept_log = ReceptLog.order('id DESC').find_by(user_id: params[:user_id])
  
     @recept_log.total = @cart_items.sum(:total_cost)*1.08
     @recept_log.postage = 500
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
     
     @cart_items.delete_all
     redirect_to purchase_confirmation_user_cart_purchase_pages_path(current_user.id,current_cart.id)
     
      
   end
  

  
  private 
  def ship_add_params
    params.require(:ship_adress).permit(:shipping_add,:postal_code)
  end
  
end
