class FavoritesController < ApplicationController
  def create
    package = Package.find(params[:package_id])
    favorite = current_user.favorites.new(package_id: package.id)
    package.favorite_num += 1
    package.save
    favorite.save
    redirect_to package_path(package)
  end
  
  def destroy
    package = Package.find(params[:package_id])
    favorite = current_user.favorites.find_by(package_id: package.id)
    package.favorite_num -= 1
    package.save
    favorite.destroy
    redirect_to package_path(package)
  end
end
