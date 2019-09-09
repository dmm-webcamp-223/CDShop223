require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cart_items_create_url
    assert_response :success
  end

  test "should get purchase_page" do
    get cart_items_purchase_page_url
    assert_response :success
  end

  test "should get purchase_check" do
    get cart_items_purchase_check_url
    assert_response :success
  end

  test "should get purchase_comfamation" do
    get cart_items_purchase_comfamation_url
    assert_response :success
  end

  test "should get update" do
    get cart_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_items_destroy_url
    assert_response :success
  end

end
