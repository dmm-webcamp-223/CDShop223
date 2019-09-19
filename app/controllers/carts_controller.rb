class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @cart_items = current_cart.cart_items
    @cart_number = CartItem.new

    @cart_items.each do |c|
      c.total_cost = (c.package.price * c.quantity)
      c.save
    end
  end

  # 商品詳細画面から、カートに入れるを押した時のアクション
  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(package_id: params[:package_id])
    end

    @cart_item.quantity += 1
    @cart_item.save
    redirect_to user_cart_path(current_user.id,current_cart.id)
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart_item = current_cart.cart_items.find_by(package_id: params[:package_id])
    p @cart_item
    @cart_item.update(cart_item_params)
     redirect_to user_cart_path(current_user.id,current_cart.id)
  end

  #カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    @cart_item.destroy
    redirect_to user_cart_path(current_user.id,current_cart.id)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(package_id: params[:package_id])
  end
end
