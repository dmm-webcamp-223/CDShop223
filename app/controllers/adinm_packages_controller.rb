class AdinmPackagesController < ApplicationController
	def new
	end

	def index
		@packages = Package.page(params[:page]).reverse_order
	end

	def show
	end

	def create
	end

	def updater
	end

	def edit
	end

	def destory
	end
end