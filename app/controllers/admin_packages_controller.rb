class AdminPackagesController < ApplicationController
    def new
      @artists = Artist.all
      @labels = Label.all
      @genres = Genre.all
      @package = Package.new
      @disc = @package.discs.build
      @song = @disc.songs.build 
    end

	def index
		@packages = Package.page(params[:page]).reverse_order
	end

	def show
  	  @package = Package.find(params[:id])
      @discs = Disc.all.includes(:songs)
	end

    def create
      @package = Package.new(package_params)
      if  @package.save!
          redirect_to admin_packages_path
      else 
          render :new
      end
    end

	def updater
	end

	def edit
	end

	def destory
	end
  
    private
    def package_params
        params.require(:package).permit(:title, :disc_image, :price, :disc_stock, :artist_id, :genre_id, :label_id,
          discs_attributes: [:id, :disc_number, :_destroy, 
            songs_attributes: [:id, :song, :song_number, :_destroy]])
    end
end
