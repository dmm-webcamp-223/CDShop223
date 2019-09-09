class PackagesController < ApplicationController
  def index
    @packages = Package.page(params[:page]).reverse_order
  end

  def show
  	@package = Package.find(params[:id])
  end

      private
    def package_params
        params.require(:package).permit(:title, :body)
    end
end
