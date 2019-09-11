class PackagesController < ApplicationController
  def index
    @packages = Package.page(params[:page]).reverse_order
  end

  def show
  	@package = Package.find(params[:id])
    @discs = Disc.all.includes(:songs)
  end
end
