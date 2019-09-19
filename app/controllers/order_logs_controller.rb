class OrderLogsController < ApplicationController
  def index
    @recept_logs=ReceptLog.all.reverse
    @users=User.with_deleted
  end

  def show
    @logs = PurchaseDataLog.where(recept_log_id: params[:id])
  end

  def update
    @log = ReceptLog.find(params[:id])
    @log.update(recept_params)
  end

    private
    def recept_params
      params.require(:recept_log).permit(:postal_code, :delivering_adddress, :delivered_status)
    end


end
