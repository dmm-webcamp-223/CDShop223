class OrderLogsController < ApplicationController
    before_action :authenticate_admin!
  def index
    @recept_logs=ReceptLog.page(params[:page]).reverse_order
    @users=User.with_deleted
    @times = ReceptLog.pluck(:created_at)
  end

  def show
    @logs = PurchaseDataLog.where(recept_log_id: params[:id])
  end

  def update
    @log = ReceptLog.find(params[:id])
    @log.delivered_status == true
    @log.update(delivered_status: true)
    redirect_to order_logs_path
  end



    private
    def recept_params
      params.require(:recept_log).permit(:postal_code, :delivering_adddress, :delivered_status)
    end


end
