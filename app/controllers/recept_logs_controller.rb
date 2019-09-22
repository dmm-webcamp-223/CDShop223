
class ReceptLogsController < ApplicationController
  def create

    @recept_log = ReceptLog.new(recept_params)
    @recept_log.user_id = current_user.id




    if @recept_log.save
      redirect_to purchase_check_user_cart_purchase_pages_path(current_user.id,current_cart.id)
    else
      redirect_to user_cart_purchase_page_path(current_user.id, current_cart.id, current_user.id), notice:' 配送先住所を選択してください'
    end

  end
  def update
    @log = ReceptLog.find(params[:id])
    @log.delivered_status == true
    @log.update!(delivered_status: true)
    redirect_to order_logs_path
  end



  private
  def recept_params
    params.require(:recept_log).permit(:postal_code, :delivering_adddress, :delivered_status)
  end



end
