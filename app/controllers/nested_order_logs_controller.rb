class NestedOrderLogsController < ApplicationController
  def index
    @purchase_data_logs=PurchaseDataLog.where(recept_log_id: params[:order_log_id])
  end
end
