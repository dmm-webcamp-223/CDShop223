class ArtistsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @artist = Artist.new
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to new_artist_path
    else
      redirect_to edit_artist_path, notice: "名前がありません"
    end
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to new_artist_path
    else
      redirect_to new_artist_path, notice: "名前がありません"
    end
  end

  private
  def artist_params
    params.require(:artist).permit(:artist)
  end
end
