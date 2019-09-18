class AdminUsersController < ApplicationController
	def index
		@users = User.all
	end	end

	def show
		@user = User.find(params[:id])
		@recept_logs = ReceptLog.where(recept_log_id: @user.id).all.includes(:purchase_data_logs)
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: "You have updated successfully."
		else
			render action: :edit
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	private
	def user_parms
		params.require(:user).permit(:email, :name_kanzi_sei, :name_kanzi_mei, :name_kana_sei, :name_kana_mei, :postal_code, :address, :phone_number)
	end

	def recept_log_params
		params.require(:recept_log).permit(:delivering_address, :total, :postage, :deliverd_status, :created_at, :updated_at)
	end

	def purchase_data_log_params
		params.require(:purchase_data_log).permit(:purchase_price, :tax, :numbers, :created_at)
	end