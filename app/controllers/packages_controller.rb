class PackagesController < ApplicationController
  def index
    @packages = Package.page(params[:page]).reverse_order
  end

  def show
  	@package = Package.find(params[:id])
  end
  
  def new
    @package = Package.new
    @disc = @package.discs.build
    @song = @disc.songs.build  
  end
  
  def create
    @package = Package.new(package_params)
    @package.save
  end
  

      private
    def package_params
        params.require(:package).permit(:title, :disc_image, :price, 
          discs_attributes: [:id, :song, :_destroy, 
            songs_attributes: [:id, :disc_number, :_destroy]])
    end
end




