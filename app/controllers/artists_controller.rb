class ArtistsController < ApplicationController
    before_action :authenticate_admin!
  def new
    @artist = Artist.new
    @artists = Artist.all
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to new_artist_path
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to new_artist_path
  end

  private
    def artist_params
          params.require(:artist).permit(:artist)
    end
end
