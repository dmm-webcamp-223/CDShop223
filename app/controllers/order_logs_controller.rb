class OrderLogsController < ApplicationController
    before_action :authenticate_admin!
  def index
    @recept_logs=ReceptLog.with_deleted.page(params[:page]).reverse_order
    @users=User.with_deleted

    @times = ReceptLog.with_deleted.pluck(:created_at)

  end

  def show
    @logs = PurchaseDataLog.with_deleted.where(recept_log_id: params[:id])
    @packs = Package.with_deleted
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
