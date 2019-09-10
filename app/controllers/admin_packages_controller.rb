class AdminPackagesController < ApplicationController
	def new
	end

	def index
		@packages = Package.page(params[:page]).reverse_order
	end

	def show
  	@package = Package.find(params[:id])
    @genre = Genre.find(params[:id])
    @artist = Artist.find(params[:id])
    @label = Label.find(params[:id])
    @discs = Disc.all.includes(:songs)
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
