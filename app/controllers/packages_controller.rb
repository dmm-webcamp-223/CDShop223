class PackagesController < ApplicationController
  def index
    @packages = Package.page(params[:page]).reverse_order
  end

  def show
  end

end
