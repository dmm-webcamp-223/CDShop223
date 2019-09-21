class AdminPackagesController < ApplicationController
  
   before_action :authenticate_admin!
  
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
      @discs = @package.discs.all
	end


  def create
      @package = Package.new(package_params)
      if  @package.save!
          redirect_to admin_packages_path
      else
          render :new
      end
  end

	def update
    @package = Package.find(params[:id])
     if @package.update(package_params)
     redirect_to admin_package_path(params[:id]), notice:''
    else
     render :edit
   end
	end

	def edit
    @package = Package.find(params[:id])
    @discs = @package.discs.all
    @artists = Artist.all
    @labels = Label.all
    @genres = Genre.all
	end

	def destory
      package = Pckage.find(params[:id])
      package.destroy
	end

    private
    def package_params
        params.require(:package).permit(:title, :disc_image, :price, :disc_stock, :artist_id, :genre_id, :label_id, :disc_status,
          discs_attributes: [:id, :disc_number, :_destroy,
            songs_attributes: [:id, :song, :song_number, :_destroy]])
    end
end
