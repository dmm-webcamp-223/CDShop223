class UsersController < ApplicationController
  def edit
  end

  def index
  end

  def update
  end

  def destroy
  end

  def show
  end

  def admin_show
    @users = User.search(params[:search])
  end

  def admin_edit
  end
end
