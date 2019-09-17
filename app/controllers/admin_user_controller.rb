class AdminUserController < ApplicationController
	def new
	end

	def index
		@users = User.all
	end

	def show
		@user = Uaser.find(params[:id])
	end

	def create
	end

	def update
	end

	def edit
	end

	def destory
	end
end
