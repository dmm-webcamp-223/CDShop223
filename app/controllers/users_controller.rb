class UsersController < ApplicationController
  def edit
  end

  def index
  end

  def update
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    @recept_logs = ReceptLog.where(recept_log_id: current_user.id).all.includes(:purchase_data_logs)
  end

  private
  def user_params
    params.require(:user).permit(:name_kanzi_sei, :name_kanzi_mei, :name_kana_sei)
  end

  def recept_log_params
    params.require(:recept_log).permit(:delivering_address, :total, :postage, :deliverd_status, :created_at, :updated_at)
  end

  def purchase_data_log_params
    params.require(:purchase_data_log).permit(:purchase_price, :tax, :numbers, :created_at)
  end

end