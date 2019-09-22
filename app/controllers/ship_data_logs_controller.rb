class ShipDataLogsController < ApplicationController
    before_action :authenticate_admin!
  def new
    @logs = ShipDataLog.new
    @packages = Package.all
  end

  def index
    @logs = ShipDataLog.all.reverse #逆順
  end

  def create
    @logs = ShipDataLog.new(ship_data_log_params)
    if @logs.save
      redirect_to ship_data_logs_path
    else
      render :new
    end
  end
  def edit
    @log = ShipDataLog.find(params[:id])
  end

#----------------------------------- 入荷枚数の変動-----------------------------------
  def update
    @log = ShipDataLog.find(params[:id])
       @log.update(ship_data_log_params)
    if @log.shiped_number.to_i >= 1
       @log.update(ship_data_log_params)
        pack = Package.find_by(id: @log.package_id)
        stock = @log.shiped_number.to_i + pack.disc_stock.to_i
        pack.update(disc_stock: stock)
        @log.update(arrival_status: true)
        redirect_to admin_package_path(@log.package)
    else
       @log.arrival_status = false
       redirect_to ship_data_logs_path, notice:' 1 以上を入力してください'
    end
  end

   private

  def ship_data_log_params
        params.require(:ship_data_log).permit(:package_id, :title, :ship_number, :supplier, :shiped_number)
  end
end
