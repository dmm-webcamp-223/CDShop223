class GenresController < ApplicationController
    before_action :authenticate_admin!
  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to new_genre_path
    else
      redirect_to  new_genre_path, notice:"名前がありません"
    end
  end

    def edit
      @genre = Genre.find(params[:id])
    end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
       redirect_to new_genre_path
    else
      redirect_to edit_genre_path(genre.id), notice:"名前がありません"
    end
  end

  private
    def genre_params
          params.require(:genre).permit(:category)
    end
end
