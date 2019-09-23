class AdminUsersController < ApplicationController
	  before_action :authenticate_admin!
	def index
		@users = User.with_deleted.search(params[:search])

	end

	def show
		@user = User.with_deleted.find(params[:id])
		@recept_logs = @user.recept_logs.with_deleted.group_by{|recept_log|recept_log.created_at.strftime('%Y/%m')}
	end

	def update
		@user = User.with_deleted.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: "You have updated successfully."
		else
			render action: :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path
	end

	def edit
		@user = User.with_deleted.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:email, :name_kanzi_sei, :name_kanzi_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :phone_number)
	end

	def recept_log_params
		params.require(:recept_log).permit(:delivering_address, :total, :postage, :deliverd_status, :created_at, :updated_at)
	end

	def purchase_data_log_params
		params.require(:purchase_data_log).permit(:purchase_price, :tax, :numbers, :created_at)
	end
end
