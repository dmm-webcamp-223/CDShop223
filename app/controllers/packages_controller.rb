class PackagesController < ApplicationController
  def index
    @packages = Package.page(params[:page]).reverse_order
  end

  def show
  	@package = Package.find(params[:id])
<<<<<<< HEAD
  end
  



=======
    @discs = Disc.all.includes(:songs)
  # @artists = Artist.all.includes(:songs)
  end
      private
    def package_params
        params.require(:package).permit(:title, :disc_image, :price, 
          discs_attributes: [:id, :song, :_destroy, 
            songs_attributes: [:id, :disc_number, :_destroy]])
    end
>>>>>>> 9e7bf532b10490fdd202666021d3fb5f802e1751
end




