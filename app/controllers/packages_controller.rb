class PackagesController < ApplicationController
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

      private
    def package_params
        params.require(:package).permit(:title, :body)
    end
end
